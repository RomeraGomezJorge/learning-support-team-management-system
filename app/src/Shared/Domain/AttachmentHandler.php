<?php
	
	declare(strict_types=1);
	
	namespace App\Shared\Domain;
	
	interface AttachmentHandler
	{
		public function delete(string $attachmentDirectory,string $attachmentFileName): void;
		
	}