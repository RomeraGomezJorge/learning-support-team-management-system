<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\User\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\StringValueObject;
  use InvalidArgumentException;
  
  
  final class UserPassword extends StringValueObject
	{
		
		public function __construct(string $value)
		{
			parent::__construct($value);
			parent::minLength($this->value,8);
			parent::maxLength($this->value,20);
			$this->ensureHasAtLeastOneUppercaseCharacter($this->value);
			$this->ensureHasAtLeastOneNumber($this->value);
		}
		
		private function ensureHasAtLeastOneUppercaseCharacter(string $password): void
		{
			if (1 !== preg_match('/[A-Z]+/', $password)) {
				throw new InvalidArgumentException('The password must include at least one capital letter.');
			};
		}
		
		private function ensureHasAtLeastOneNumber(string $password): void
		{
			if (1 !== preg_match('/[0-9Z]+/', $password)) {
				throw new InvalidArgumentException('The password must include at least one number.');
			};
		}
		
	}