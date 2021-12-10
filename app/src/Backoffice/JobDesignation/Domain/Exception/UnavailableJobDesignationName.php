<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\JobDesignation\Domain\Exception;
	
	use App\Backoffice\JobDesignation\Domain\ValueObject\JobDesignationName;
	use App\Shared\Domain\DomainError;
	
	final class UnavailableJobDesignationName extends DomainError
	{
		private string $name;
		
		public function __construct(JobDesignationName $name)
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