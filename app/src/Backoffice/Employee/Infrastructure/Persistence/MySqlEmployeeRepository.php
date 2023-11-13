<?php

  declare(strict_types=1);

  namespace App\Backoffice\Employee\Infrastructure\Persistence;

  use App\Backoffice\Employee\Domain\Employee;
  use App\Backoffice\Employee\Domain\EmployeeRepository;
  use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
  use App\Backoffice\JobDesignation\Domain\JobDesignation;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
  use App\Shared\Domain\Criteria\Criteria;
  use App\Shared\Domain\ValueObject\Uuid;
  use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineCriteriaConverter;
  use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineRepository;
  use Doctrine\Common\Collections\Criteria as DoctrineCriteria;
  use Doctrine\ORM\Tools\Pagination\Paginator;

  final class MySqlEmployeeRepository extends DoctrineRepository implements EmployeeRepository
{
    private const NOT_SETTING_VALUE = null;
    private const ENTITY_CLASS = Employee::class;
    private const IS_NOT_DEFINED_AS_A_FILTER = null;

    private ?int $totalMatchingRows = null;

    public function save(Employee $jobDesignation): void
    {
        $this->persist($jobDesignation);
    }

    public function search(Uuid $id): ?Employee
    {
        return $this->repository(self::ENTITY_CLASS)->find($id);
    }

    public function searchAll(): array
    {
        return $this->repository(self::ENTITY_CLASS)->findAll();
    }

    public function isAvailable(array $criteria): bool
    {
        return !((bool)$this->repository(self::ENTITY_CLASS)
            ->findOneBy($criteria));
    }

    public function matching(
        Criteria $totalMatchingRowsCriteria,
        ?JobDesignation $jobDesignation,
        ?EmploymentContract $employmentContract,
        ?LearningSupportTeam $learningSupportTeam
    ): array {
        $doctrineCriteria = DoctrineCriteriaConverter::convert($totalMatchingRowsCriteria);

        $doctrineCriteria = $this->addAnAssociationAsCriteria(
            $doctrineCriteria,
            $jobDesignation,
            'jobDesignation'
        );

        $doctrineCriteria = $this->addAnAssociationAsCriteria(
            $doctrineCriteria,
            $employmentContract,
            'employmentContract'
        );

        if ($learningSupportTeam !== null) {
            $query = $this->repository(self::ENTITY_CLASS)
                ->createQueryBuilder('employee')
                ->addCriteria($doctrineCriteria)
                ->innerJoin('employee.jobDesignation', 'jobDesignation')
                ->innerJoin('employee.employmentContract', 'employmentContract')
                ->innerJoin('employee.learningSupportTeam', 'learningSupportTeam')
                ->andWhere('learningSupportTeam.id = :learningSupportTeamId')
                ->setParameter('learningSupportTeamId', $learningSupportTeam->id());

            $totalMatchingRowsQuery = $query->select('count(employee)');

            $paginator = new Paginator($totalMatchingRowsQuery);

            $paginator->setUseOutputWalkers(false);

            $this->totalMatchingRows = count($paginator);

            return $query->select(
                'employee',
                'jobDesignation',
                'employmentContract',
                'learningSupportTeam'
            )
                ->getQuery()
                ->getResult();
        }

        $matching = $this->repository(self::ENTITY_CLASS)
            ->matching($doctrineCriteria);

        $this->totalMatchingRows = $matching->count();

        return $matching->toArray();
    }

    private function addAnAssociationAsCriteria(
        DoctrineCriteria $doctrineCriteria,
        $entity,
        $fieldName
    ): DoctrineCriteria {
        if ($entity === self::IS_NOT_DEFINED_AS_A_FILTER) {
            return $doctrineCriteria;
        }

        return $doctrineCriteria->andWhere(DoctrineCriteria::expr()
            ->eq($fieldName, $entity));
    }

    public function totalMatchingRows(
        Criteria $criteria,
        ?JobDesignation $jobDesignation,
        ?EmploymentContract $employmentContract,
        ?LearningSupportTeam $learningSupportTeam
    ): int {
        if ($this->totalMatchingRows === self::NOT_SETTING_VALUE) {
            $this->matching(
                $criteria,
                $jobDesignation,
                $employmentContract,
                $learningSupportTeam
            );

            return $this->totalMatchingRows;
        }

        return $this->totalMatchingRows;
    }

    public function delete(Employee $jobDesignation): void
    {
        $this->remove($jobDesignation);
    }
}
