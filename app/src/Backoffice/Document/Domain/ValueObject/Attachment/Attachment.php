<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Domain\ValueObject\Attachment;
	
	
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentDescription;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentType;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentUrl;
  
  class Attachment
	{
		private string $url;
		private string $type;
		private string $description;
		
		public static function create(
			AttachmentUrl $url,
			AttachmentType $type,
			AttachmentDescription $description
		): self {
			$attachment = new self();
			$attachment->url = $url->value();
			$attachment->type = $type->value();
			$attachment->description = $description->value();
			
			return $attachment;
		}
		
		public function toArray(): array
		{
			return [
				'url' => $this->url,
				'type' => $this->type,
				'description' => $this->description,
			];
		}
		
		public function url(): string
		{
			return $this->url;
		}
	}
