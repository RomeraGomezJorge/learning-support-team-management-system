<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Domain\Exception;
	
	use App\Shared\Domain\DomainError;
 
	final class DocumentNotExist extends DomainError
	{
		private string $id;
		
		public function __construct(string $id)
		{
			$this->id = $id;
			
			parent::__construct();
		}
		
		public function errorCode(): string
		{
			return 'document_not_exist';
		}
		
		protected function errorMessage(): string
		{
			return sprintf('The document <%s> does not exist', $this->id);
		}
	}