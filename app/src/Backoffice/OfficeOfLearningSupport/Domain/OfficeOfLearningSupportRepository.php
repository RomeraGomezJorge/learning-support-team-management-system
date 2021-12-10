<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Domain;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	
	interface OfficeOfLearningSupportRepository
	{
		public function save(OfficeOfLearningSupport $officeOfLearningSupport): void;
		
		public function search(Uuid $id): ?OfficeOfLearningSupport;
		
		public function searchAll(): array;
		
		public function matching(Criteria $criteria): array;
		
		public function totalMatchingRows(Criteria $criteria): int;
		
		public function delete(OfficeOfLearningSupport $officeOfLearningSupport): void;
    
    public function getAllSortedAlphabeticallyByDistrict(): array;
	}