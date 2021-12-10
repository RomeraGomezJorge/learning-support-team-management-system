<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Employee\Application\Get\Single;
	
	use App\Backoffice\Employee\Domain\Employee;
	use App\Backoffice\Employee\Domain\EmployeeRepository;
	use App\Backoffice\Employee\Domain\Exception\EmployeeNotExist;
	use App\Shared\Domain\ValueObject\Uuid;
	
	final class EmployeeFinder
	{
		const NOT_FOUND = null;
		private EmployeeRepository $repository;
		
		public function __construct(EmployeeRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $id): Employee
		{
			$id = new Uuid($id);
			
			$jobDesignation = $this->repository->search($id);
			
			if (self::NOT_FOUND === $jobDesignation) {
				throw new EmployeeNotExist(($id)->value());
			}
			
			return $jobDesignation;
		}
	}