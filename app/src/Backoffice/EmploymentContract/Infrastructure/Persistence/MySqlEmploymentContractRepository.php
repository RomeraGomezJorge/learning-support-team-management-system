<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Infrastructure\Persistence;
	
	use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
	use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineCriteriaConverter;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineRepository;
	use Doctrine\Common\Collections\Collection;
	
	final class MySqlEmploymentContractRepository extends DoctrineRepository implements EmploymentContractRepository
	{
		const NOT_SETTING_VALUE = null;
		const ENTITY_CLASS = EmploymentContract::class;
		private ?int $totalMatchingRows = null;
		
		public function save(EmploymentContract $EmploymentContract): void
		{
			$this->persist($EmploymentContract);
		}
		
		public function search(Uuid $id): ?EmploymentContract
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
		
		public function delete(EmploymentContract $EmploymentContract): void
		{
			$this->remove($EmploymentContract);
		}
	}