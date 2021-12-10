<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\JobDesignation\Domain;
	
	class JobDesignationNameIsAvailableSpecification
	{
		private JobDesignationRepository $repository;
		
		public function __construct(JobDesignationRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function isSatisfiedBy(JobDesignation $jobDesignation): bool
		{
			return $this->repository->isAvailable(array('name' => $jobDesignation->name()));
		}
	}