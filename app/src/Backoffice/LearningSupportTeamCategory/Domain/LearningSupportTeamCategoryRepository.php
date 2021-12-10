<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Domain;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	
	interface LearningSupportTeamCategoryRepository
	{
		public function save(LearningSupportTeamCategory $learningSupportTeamCategory): void;
		
		public function search(Uuid $id): ?LearningSupportTeamCategory;
		
		public function searchAll(): array;
		
		public function matching(Criteria $criteria): array;
		
		public function totalMatchingRows(Criteria $criteria): int;
		
		public function delete(LearningSupportTeamCategory $learningSupportTeamCategory): void;
		
		public function isAvailable(array $criteria): bool;
	}