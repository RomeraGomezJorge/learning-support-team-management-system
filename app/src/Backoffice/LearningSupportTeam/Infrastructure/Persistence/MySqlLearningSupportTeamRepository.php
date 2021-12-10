<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Infrastructure\Persistence;
	
	use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
	use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineCriteriaConverter;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineRepository;
	use Doctrine\Common\Collections\Collection;
	
	final class MySqlLearningSupportTeamRepository extends DoctrineRepository implements LearningSupportTeamRepository
	{
		const NOT_SETTING_VALUE = null;
		const ENTITY_CLASS = LearningSupportTeam::class;
		private ?int $totalMatchingRows = null;
		
		public function save(LearningSupportTeam $learningSupportTeam): void
		{
			$this->persist($learningSupportTeam);
		}
		
		public function search(Uuid $id): ?LearningSupportTeam
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
		
		public function delete(LearningSupportTeam $learningSupportTeam): void
		{
			$this->remove($learningSupportTeam);
		}
	}