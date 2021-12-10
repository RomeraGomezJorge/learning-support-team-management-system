<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\JobDesignation\Application\Get\Single;
	
	use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
	
	final class CheckJobDesignationNameAvailability
	{
		private JobDesignationRepository $repository;
		
		public function __construct(JobDesignationRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $name): bool
		{
			return $this->repository->isAvailable(['name' => $name]);
		}
	}