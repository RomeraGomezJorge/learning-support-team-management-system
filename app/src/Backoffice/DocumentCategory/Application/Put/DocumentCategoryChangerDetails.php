<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\DocumentCategory\Application\Put;
	
	use App\Backoffice\DocumentCategory\Application\Get\Single\DocumentCategoryFinder;
	use App\Backoffice\DocumentCategory\Domain\DocumentCategoryNameIsAvailableSpecification;
	use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;
	use App\Backoffice\DocumentCategory\Domain\ValueObject\DocumentCategoryBiography;
	use App\Backoffice\DocumentCategory\Domain\ValueObject\DocumentCategoryName;
	
	final class DocumentCategoryChangerDetails
	{
		private DocumentCategoryRepository $repository;
		private DocumentCategoryFinder  $finder;
		private DocumentCategoryNameIsAvailableSpecification $nameIsAvailableSpecification;
		
		public function __construct(
			DocumentCategoryRepository $repository,
			DocumentCategoryNameIsAvailableSpecification $nameIsAvailableSpecification
		)
    {
			$this->repository = $repository;
			$this->finder = new DocumentCategoryFinder($repository);
			$this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
		}
		
		public function __invoke(string $id, string $newName): void
		{
			$documentCategory = $this->finder->__invoke($id);
			
			$documentCategory->changeDetails(
				new DocumentCategoryName($newName),
				$this->nameIsAvailableSpecification
				);
			
			$this->repository->save($documentCategory);
		}
	}