<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\StringValueObject;
	
	final class SchoolAssistedByLearningSupportTeamName extends StringValueObject
	{
		public function __construct(?string $value)
		{
      parent::__construct($value);
      parent::notEmpty($this->value);
      parent::maxLength($this->value,255);
		}
	}
