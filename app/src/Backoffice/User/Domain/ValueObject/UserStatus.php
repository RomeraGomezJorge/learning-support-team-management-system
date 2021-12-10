<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\User\Domain\ValueObject;
	
	use App\Shared\Domain\ValueObject\IntValueObject;
  use InvalidArgumentException;
	
	final class UserStatus extends IntValueObject
	{
		const ENABLE = 1;
		consT DISABLE = 0;
    const VALID_STATUS = [self::ENABLE, self::DISABLE];
		
		public function __construct(int $value)
		{
			$this->ensureIsAValidStatus($value);
			parent::__construct($value);
		}
    
    private function ensureIsAValidStatus($value): void
    {
      if (!in_array($value, self::VALID_STATUS) ) {
        throw new InvalidArgumentException(
          sprintf('The value <%s> is not a valid status to a user.',$value)
        );
      }
    }
    
    public static function enabled():int
    {
      return self::ENABLE;
    }
    
    public static function disabled():int
    {
      return self::enabled();
    }
    
	}