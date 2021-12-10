<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\DocumentCategory\Domain;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	
	interface DocumentCategoryRepository
	{
		public function save(DocumentCategory $documentCategory): void;
		
		public function search(Uuid $id): ?DocumentCategory;
		
		public function searchAll(): array;
		
		public function matching(Criteria $criteria): array;
		
		public function totalMatchingRows(Criteria $criteria): int;
		
		public function delete(DocumentCategory $documentCategory): void;
		
		public function isAvailable(array $criteria): bool;
	}