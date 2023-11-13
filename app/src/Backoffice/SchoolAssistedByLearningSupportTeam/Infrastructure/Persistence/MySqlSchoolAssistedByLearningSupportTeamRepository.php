<?php

  declare(strict_types=1);

namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\Persistence;

use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeam;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\ValueObject\Uuid;
use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineCriteriaConverter;
use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;

final class MySqlSchoolAssistedByLearningSupportTeamRepository extends DoctrineRepository implements SchoolAssistedByLearningSupportTeamRepository
{
    private const NOT_SETTING_VALUE = null;
    private const ENTITY_CLASS = SchoolAssistedByLearningSupportTeam::class;

    private ?int $totalMatchingRows = null;

    public function save(
        SchoolAssistedByLearningSupportTeam $schoolsAssistedByLearningSupportTeam
    ): void {
        $this->persist($schoolsAssistedByLearningSupportTeam);
    }

    public function search(Uuid $id): ?SchoolAssistedByLearningSupportTeam
    {
        return $this->repository(self::ENTITY_CLASS)->find($id);
    }

    public function searchAll(): array
    {
        return $this->repository(self::ENTITY_CLASS)->findAll();
    }

    public function matching(
        Criteria $criteria,
        ?LearningSupportTeam $learningSupportTeam
    ): array {

        $doctrineCriteria = DoctrineCriteriaConverter::convert($criteria);

        if ($learningSupportTeam !== null) {
            $query = $this->repository(self::ENTITY_CLASS)
                ->createQueryBuilder('school')
                ->addCriteria($doctrineCriteria)
                ->innerJoin('school.learningSupportTeams', 'learningSupportTeams')
                ->andWhere('learningSupportTeams.id = :learningSupportTeamId')
                ->setParameter('learningSupportTeamId', $learningSupportTeam->id());

            $totalMatchingRowsQuery = $query->select('count(school)');

            $paginator = new Paginator($totalMatchingRowsQuery);

            $paginator->setUseOutputWalkers(false);

            $this->totalMatchingRows = count($paginator);

            return $query->select('school', 'learningSupportTeams')
                ->getQuery()
                ->getResult();
        }

        $matching = $this->repository(self::ENTITY_CLASS)->matching($doctrineCriteria);

        $this->totalMatchingRows = $matching->count();

        return $matching->toArray();
    }


    public function totalMatchingRows(
        Criteria $criteria,
        ?LearningSupportTeam $learningSupportTeam
    ): int {
        if ($this->totalMatchingRows === self::NOT_SETTING_VALUE) {
            $this->matching($criteria, $learningSupportTeam);

            return $this->totalMatchingRows;
        }

        return $this->totalMatchingRows;
    }

    public function delete(
        SchoolAssistedByLearningSupportTeam $schoolsAssistedByLearningSupportTeam
    ): void {
        $this->remove($schoolsAssistedByLearningSupportTeam);
    }
}
