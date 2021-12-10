<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\User\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\StringValueObject;
	
	final class UserSurname extends StringValueObject
	{
		public function __construct(string $value)
		{
      parent::__construct($value);
      parent::minLength($this->value, 3);
      parent::maxLength($this->value, 100);
		}
	}