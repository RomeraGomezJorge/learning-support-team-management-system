<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Domain\Exception;
	
	use App\Shared\Domain\DomainError;
	
	final class EmploymentContractNotExist extends DomainError
	{
		private string $id;
		
		public function __construct(string $id)
		{
			$this->id = $id;
			
			parent::__construct();
		}
		
		public function errorCode(): string
		{
			return 'employment_contract_not_exist';
		}
		
		protected function errorMessage(): string
		{
			return sprintf('The employment contract <%s> does not exist', $this->id);
		}
	}