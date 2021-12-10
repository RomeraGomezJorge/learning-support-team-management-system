<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject;
	
	use InvalidArgumentException;
	
	class AttachmentType
	{
		const IMAGE = "1";
		const DOCUMENT = "2";
		const VALID_TYPES = [self::IMAGE, self::DOCUMENT];
		private $type;
		
		public function __construct($type)
		{
			$this->ensureIsAValidType($type);
			
			$this->type = $type;
		}
		
		private function ensureIsAValidType($type): void
		{
			if (!in_array($type, self::VALID_TYPES)) {
				throw new InvalidArgumentException(sprintf('The value <%s> is not a valid type of file.',
					$type));
			}
		}
		
		public function __toString(): string
		{
			return (string)$this->value();
		}
		
		public function value(): string
		{
			return $this->type;
		}
	}