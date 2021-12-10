<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Application\Delete;
	
	use App\Backoffice\Document\Application\Get\Single\DocumentFinder;
	use App\Backoffice\Document\Domain\DocumentRepository;
	
	final class DocumentDeleter
	{
		private DocumentRepository $repository;
		private DocumentFinder $finder;
		
		public function __construct(
			DocumentRepository $repository
		) {
			$this->repository = $repository;
			$this->finder = new DocumentFinder($repository);
		}
		
		public function __invoke(string $id)
		{
			$document = $this->finder->__invoke($id);
			
			$this->repository->delete($document);
		}
	}