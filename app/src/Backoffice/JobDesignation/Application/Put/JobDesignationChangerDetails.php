<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\JobDesignation\Application\Put;
	
	use App\Backoffice\JobDesignation\Application\Get\Single\JobDesignationFinder;
	use App\Backoffice\JobDesignation\Domain\JobDesignationNameIsAvailableSpecification;
	use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
	use App\Backoffice\JobDesignation\Domain\ValueObject\JobDesignationBiography;
	use App\Backoffice\JobDesignation\Domain\ValueObject\JobDesignationName;
	
	final class JobDesignationChangerDetails
	{
		private JobDesignationRepository $repository;
		private JobDesignationFinder  $finder;
		private JobDesignationNameIsAvailableSpecification $nameIsAvailableSpecification;
		
		public function __construct(
			JobDesignationRepository $repository,
			JobDesignationNameIsAvailableSpecification $nameIsAvailableSpecification
		)
    {
			$this->repository = $repository;
			$this->finder = new JobDesignationFinder($repository);
			$this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
		}
		
		public function __invoke(string $id, string $newName): void
		{
			$jobDesignation = $this->finder->__invoke($id);
			
			$jobDesignation->changeDetails(
				new JobDesignationName($newName),
				$this->nameIsAvailableSpecification
				);
			
			$this->repository->save($jobDesignation);
		}
	}