<?php
	
	declare(strict_types=1);
	
	namespace App\Shared\Domain\ValueObject;
	
	
  use BadMethodCallException;
  use DateTime;
  use DateTimeImmutable;
  use InvalidArgumentException;
  use Traversable;
  
  
  abstract class StringValueObject extends ValueObject
	{
		protected ?string $value;
		
		public function __construct(?string $value)
		{
			$this->value = is_null($value)? $value: trim($value);
		}
		
		public function value(): ?string
		{
			return $this->value;
		}
  
    public static function notEmpty($value, $message = '')
    {
      if (empty($value)) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected a non-empty value. Got: %s',
          static::valueToString($value)
        ));
      }
    }
  
    public static function minLength($value, $min, $message = '')
    {
      if (static::strlen($value) < $min) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected a value to contain at least %2$s characters. Got: %s',
          static::valueToString($value),
          $min
        ));
      }
    }
  
    public static function maxLength($value, $max, $message = '')
    {
      if (static::strlen($value) > $max) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected a value to contain at most %2$s characters. Got: %s',
          static::valueToString($value),
          $max
        ));
      }
    }
  
    public static function nullOrMaxLength($value, $max, $message = '')
    {
      static::__callStatic('nullOrMaxLength', array($value, $max, $message));
    }
    
    public static function length($value, $length, $message = '')
    {
      if ($length !== static::strlen($value)) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected a value to contain %2$s characters. Got: %s',
          static::valueToString($value),
          $length
        ));
      }
    }
    
  
    public static function nullOrLength($value, $max, $message = '')
    {
      static::__callStatic('nullOrLength', array($value, $max, $message));
    }
  
    public static function email($value, $message = '')
    {
      if (false === \filter_var($value, FILTER_VALIDATE_EMAIL)) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected a value to be a valid e-mail address. Got: %s',
          static::valueToString($value)
        ));
      }
    }
  
    public static function nullOrEmail($value, $message = '')
    {
      static::__callStatic('nullOrEmail', array($value, $message));
    }
  
    public static function numeric($value, $message = '')
    {
      if (!\is_numeric($value)) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected a numeric. Got: %s',
          static::typeToString($value)
        ));
      }
    }
  
    public static function nullOrNumeric($value, $message = '')
    {
      static::__callStatic('nullOrNumeric', array($value, $message));
    }
  
    protected static function valueToString($value)
    {
      if (null === $value) {
        return 'null';
      }
    
      if (true === $value) {
        return 'true';
      }
    
      if (false === $value) {
        return 'false';
      }
    
      if (\is_array($value)) {
        return 'array';
      }
    
      if (\is_object($value)) {
        if (\method_exists($value, '__toString')) {
          return \get_class($value).': '.self::valueToString($value->__toString());
        }
      
        if ($value instanceof DateTime || $value instanceof DateTimeImmutable) {
          return \get_class($value).': '.self::valueToString($value->format('c'));
        }
      
        return \get_class($value);
      }
    
      if (\is_resource($value)) {
        return 'resource';
      }
    
      if (\is_string($value)) {
        return '"'.$value.'"';
      }
    
      return (string) $value;
    }
  
    protected static function strlen($value)
    {
      if (!\function_exists('mb_detect_encoding')) {
        return \strlen($value);
      }
    
      if (false === $encoding = \mb_detect_encoding($value)) {
        return \strlen($value);
      }
    
      return \mb_strlen($value, $encoding);
    }
  
    protected static function reportInvalidArgument($message)
    {
      throw new InvalidArgumentException($message);
    }
  
    public static function __callStatic($name, $arguments)
    {
      if ('nullOr' === \substr($name, 0, 6)) {
        if (null !== $arguments[0]) {
          $method = \lcfirst(\substr($name, 6));
          \call_user_func_array(array('static', $method), $arguments);
        }
      
        return;
      }
    
      if ('all' === \substr($name, 0, 3)) {
        static::isIterable($arguments[0]);
      
        $method = \lcfirst(\substr($name, 3));
        $args = $arguments;
      
        foreach ($arguments[0] as $entry) {
          $args[0] = $entry;
        
          \call_user_func_array(array('static', $method), $args);
        }
      
        return;
      }
    
      throw new BadMethodCallException('No such method: '.$name);
    }
  
    public static function isIterable($value, $message = '')
    {
      if (!\is_array($value) && !($value instanceof Traversable)) {
        static::reportInvalidArgument(\sprintf(
          $message ?: 'Expected an iterable. Got: %s',
          static::typeToString($value)
        ));
      }
    }
  
    protected static function typeToString($value)
    {
      return \is_object($value) ? \get_class($value) : \gettype($value);
    }
  
	}
