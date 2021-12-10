<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\User\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\StringValueObject;
	use Webmozart\Assert\Assert;
	
	final class UserName extends StringValueObject
	{
		public function __construct(string $value)
		{
      parent::__construct($value);
      parent::minLength($value, 3);
      parent::maxLength($value, 100);
		}
	}