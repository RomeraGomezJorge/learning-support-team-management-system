<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\DocumentCategory\Application\Get\Single;
	
	use App\Backoffice\DocumentCategory\Domain\DocumentCategory;
	use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;
	use App\Backoffice\DocumentCategory\Domain\Exception\DocumentCategoryNotExist;
  use App\Shared\Application\Get\Collection\Finder;
  use App\Shared\Domain\ValueObject\Uuid;
	
	final class DocumentCategoryFinder implements Finder
	{
		const NOT_FOUND = null;
		private DocumentCategoryRepository $repository;
		
		public function __construct(DocumentCategoryRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $id): DocumentCategory
		{
			$id = new Uuid($id);
			
			$documentCategory = $this->repository->search($id);
			
			if (self::NOT_FOUND === $documentCategory) {
				throw new DocumentCategoryNotExist(($id)->value());
			}
			
			return $documentCategory;
		}
	}