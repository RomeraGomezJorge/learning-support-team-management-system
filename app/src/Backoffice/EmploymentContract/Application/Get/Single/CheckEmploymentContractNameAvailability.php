<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Application\Get\Single;
	
	use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
	
	final class CheckEmploymentContractNameAvailability
	{
		private EmploymentContractRepository $repository;
		
		public function __construct(EmploymentContractRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $name): bool
		{
			return $this->repository->isAvailable(['name' => $name]);
		}
	}