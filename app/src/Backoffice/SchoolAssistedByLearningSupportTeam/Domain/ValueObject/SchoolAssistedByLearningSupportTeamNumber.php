<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject;
	
  use App\Shared\Domain\ValueObject\StringValueObject;
	
	final class SchoolAssistedByLearningSupportTeamNumber extends StringValueObject
	{
		public function __construct(?string $value)
		{
			parent::__construct($value);
			parent::nullOrNumeric($this->value);
		}
	}
