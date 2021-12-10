<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\StringValueObject;
	
	
	final class DocumentNumber extends StringValueObject
	{
		public function __construct(?string $value)
		{
      parent::__construct($value);
      parent::nullOrMaxLength($this->value, 100);
		}
	}