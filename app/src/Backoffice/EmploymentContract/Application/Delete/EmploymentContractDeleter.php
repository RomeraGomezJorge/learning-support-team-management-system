<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Application\Delete;
	
	use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
	use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
	
	final class EmploymentContractDeleter
	{
		private EmploymentContractRepository $repository;
		private EmploymentContractFinder $finder;
		
		public function __construct(
			EmploymentContractRepository $repository
		) {
			$this->repository = $repository;
			$this->finder = new EmploymentContractFinder($repository);
		}
		
		public function __invoke(string $id)
		{
			$EmploymentContract = $this->finder->__invoke($id);
			
			$this->repository->delete($EmploymentContract);
		}
	}