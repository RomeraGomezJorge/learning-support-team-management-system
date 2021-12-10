<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Application\Delete;
	
	use App\Backoffice\OfficeOfLearningSupport\Application\Get\Single\OfficeOfLearningSupportFinder;
	use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
	
	final class OfficeOfLearningSupportDeleter
	{
		private OfficeOfLearningSupportRepository $repository;
		private OfficeOfLearningSupportFinder $finder;
		
		public function __construct(
			OfficeOfLearningSupportRepository $repository
		) {
			$this->repository = $repository;
			$this->finder = new OfficeOfLearningSupportFinder($repository);
		}
		
		public function __invoke(string $id)
		{
			$officeOfLearningSupport = $this->finder->__invoke($id);
			
			$this->repository->delete($officeOfLearningSupport);
		}
	}