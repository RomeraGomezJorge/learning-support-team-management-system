<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Domain;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\ValueObject\Uuid;
	
	interface DocumentRepository
	{
		public function save(Document $document): void;
		
		public function search(Uuid $id): ?Document;
		
		public function searchAll(): array;
		
		public function matching(Criteria $criteria): array;
		
		public function totalMatchingRows(Criteria $criteria): int;
		
		public function delete(Document $document): void;
    
    public function getAllSortedAlphabeticallyByDistrict(): array;
	}