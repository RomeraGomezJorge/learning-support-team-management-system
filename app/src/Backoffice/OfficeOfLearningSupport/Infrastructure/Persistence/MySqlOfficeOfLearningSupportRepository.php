<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\Persistence;
	
	use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupport;
	use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineCriteriaConverter;
	use App\Shared\Infrastructure\Persistence\Doctrine\DoctrineRepository;
	use Doctrine\Common\Collections\Collection;
	
	final class MySqlOfficeOfLearningSupportRepository extends DoctrineRepository implements OfficeOfLearningSupportRepository
	{
		const NOT_SETTING_VALUE = null;
		const ENTITY_CLASS = OfficeOfLearningSupport::class;
		private ?int $totalMatchingRows = null;
		
		public function save(OfficeOfLearningSupport $officeOfLearningSupport): void
		{
			$this->persist($officeOfLearningSupport);
		}
		
		public function search(Uuid $id): ?OfficeOfLearningSupport
		{
			return $this->repository(self::ENTITY_CLASS)->find($id);
		}
		
		public function searchAll(): array
		{
			return $this->repository(self::ENTITY_CLASS)->findAll();
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
		
		public function delete(OfficeOfLearningSupport $officeOfLearningSupport): void
		{
			$this->remove($officeOfLearningSupport);
		}
    
    public function getAllSortedAlphabeticallyByDistrict() :array
    {
      return $this->repository(self::ENTITY_CLASS)
        ->createQueryBuilder('OLS')
        ->select('OLS.id', 'OLS.address', 'OLSInDistrict.name AS district_name')
        ->innerJoin('OLS.officeOfLearningSupportInDistrict','OLSInDistrict')
        ->orderBy('OLSInDistrict.name','ASC')
        ->getQuery()
        ->getArrayResult();
		}
	}