<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Employee\Domain\Exception;
	
	use App\Shared\Domain\DomainError;
	
	final class EmployeeNotExist extends DomainError
	{
		private string $id;
		
		public function __construct(string $id)
		{
			$this->id = $id;
			
			parent::__construct();
		}
		
		public function errorCode(): string
		{
			return 'employee_not_exist';
		}
		
		protected function errorMessage(): string
		{
			return sprintf('The employee <%s> does not exist', $this->id);
		}
	}