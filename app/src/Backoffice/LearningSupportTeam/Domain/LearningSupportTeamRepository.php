<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Domain;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	
	interface LearningSupportTeamRepository
	{
		public function save(LearningSupportTeam $learningSupportTeam): void;
		
		public function search(Uuid $id): ?LearningSupportTeam;
		
		public function searchAll(): array;
		
		public function matching(Criteria $criteria): array;
		
		public function totalMatchingRows(Criteria $criteria): int;
		
		public function delete(LearningSupportTeam $learningSupportTeam): void;
		
		public function isAvailable(array $criteria): bool;
	}