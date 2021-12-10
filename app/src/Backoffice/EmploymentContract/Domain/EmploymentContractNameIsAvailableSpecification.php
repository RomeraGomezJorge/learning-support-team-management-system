<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Domain;
	
	class EmploymentContractNameIsAvailableSpecification
	{
		private EmploymentContractRepository $repository;
		
		public function __construct(EmploymentContractRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function isSatisfiedBy(EmploymentContract $employmentContract): bool
		{
			return $this->repository->isAvailable(array('name' => $employmentContract->name()));
		}
	}