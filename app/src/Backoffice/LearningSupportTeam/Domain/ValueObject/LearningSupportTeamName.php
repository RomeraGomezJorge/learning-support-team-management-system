<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\StringValueObject;
	
	
	final class LearningSupportTeamName extends StringValueObject
	{
		public function __construct(string $value)
		{
      parent::__construct($value);
      parent::minLength($this->value, 3);
      parent::maxLength($this->value, 100);
		}
	}