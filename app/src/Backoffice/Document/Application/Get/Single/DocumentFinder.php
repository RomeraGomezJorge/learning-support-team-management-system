<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Application\Get\Single;
	
	use App\Backoffice\Document\Domain\Document;
	use App\Backoffice\Document\Domain\DocumentRepository;
	use App\Backoffice\Document\Domain\Exception\DocumentNotExist;
	use App\Shared\Domain\ValueObject\Uuid;
	
	final class DocumentFinder
	{
		const NOT_FOUND = null;
		private DocumentRepository $repository;
		
		public function __construct(DocumentRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $id): Document
		{
			$id = new Uuid($id);
			
			$document = $this->repository->search($id);
			
			if (self::NOT_FOUND === $document) {
				throw new DocumentNotExist(($id)->value());
			}
			
			return $document;
		}
	}