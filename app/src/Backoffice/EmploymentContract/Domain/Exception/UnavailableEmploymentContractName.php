<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Domain\Exception;
	
	use App\Backoffice\EmploymentContract\Domain\ValueObject\EmploymentContractName;
	use App\Shared\Domain\DomainError;
	
	final class UnavailableEmploymentContractName extends DomainError
	{
		private string $name;
		
		public function __construct(EmploymentContractName $name)
		{
			$this->name = $name->value();
			
			parent::__construct();
		}
		
		public function errorCode(): string
		{
			return 'name_already_exists';
		}
		
		protected function errorMessage(): string
		{
			return sprintf(' "%s" value is already used.', $this->name);
		}
	}