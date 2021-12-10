<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\JobDesignation\Infrastructure\Persistence;
	
	use App\Backoffice\JobDesignation\Domain\JobDesignation;
	use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineCriteriaConverter;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineRepository;
	use Doctrine\Common\Collections\Collection;
	
	final class MySqlJobDesignationRepository extends DoctrineRepository implements JobDesignationRepository
	{
		const NOT_SETTING_VALUE = null;
		const ENTITY_CLASS = JobDesignation::class;
		private ?int $totalMatchingRows = null;
		
		public function save(JobDesignation $jobDesignation): void
		{
			$this->persist($jobDesignation);
		}
		
		public function search(Uuid $id): ?JobDesignation
		{
			return $this->repository(self::ENTITY_CLASS)->find($id);
		}
		
		public function searchAll(): array
		{
			return $this->repository(self::ENTITY_CLASS)->findAll();
		}
		
		public function isAvailable(array $criteria): bool
		{
			return !((bool)$this->repository(self::ENTITY_CLASS)->findOneBy($criteria));
		}
		
		public function matching(Criteria $criteria): array
		{
			$matching = $this->getMatchingFrom($criteria);
			
			$this->totalMatchingRows = $matching->count();
			
			return $matching->toArray();
		}
		
		private function getMatchingFrom(Criteria $criteria): Collection
		{
			$doctrineCriteria = DoctrineCriteriaConverter::convert($criteria);
			
			return $this->repository(self::ENTITY_CLASS)->matching($doctrineCriteria);
		}
		
		public function totalMatchingRows(Criteria $criteria): int
		{
			if ($this->totalMatchingRows === self::NOT_SETTING_VALUE) {
				return $this->getMatchingFrom($criteria)->count();
			}
			
			return $this->totalMatchingRows;
		}
		
		public function delete(JobDesignation $jobDesignation): void
		{
			$this->remove($jobDesignation);
		}
	}