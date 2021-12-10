<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	
	interface OfficeOfLearningSupportInDistrictRepository
	{
		public function save(OfficeOfLearningSupportInDistrict $officeOfLearningSupportInDistrict): void;
		
		public function search(Uuid $id): ?OfficeOfLearningSupportInDistrict;
		
		public function searchAll(): array;
		
		public function matching(Criteria $criteria): array;
		
		public function totalMatchingRows(Criteria $criteria): int;
		
		public function delete(OfficeOfLearningSupportInDistrict $officeOfLearningSupportInDistrict): void;
		
		public function isAvailable(array $criteria): bool;
	}