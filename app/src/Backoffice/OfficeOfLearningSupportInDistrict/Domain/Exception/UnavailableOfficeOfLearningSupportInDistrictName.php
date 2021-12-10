<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\Exception;
	
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\ValueObject\OfficeOfLearningSupportInDistrictName;
	use App\Shared\Domain\DomainError;
	
	final class UnavailableOfficeOfLearningSupportInDistrictName extends DomainError
	{
		private string $name;
		
		public function __construct(OfficeOfLearningSupportInDistrictName $name)
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