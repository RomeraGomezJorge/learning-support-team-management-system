<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Domain\Exception;
	
	use App\Shared\Domain\DomainError;
	
	final class LearningSupportTeamCategoryNotExist extends DomainError
	{
		private string $id;
		
		public function __construct(string $id)
		{
			$this->id = $id;
			
			parent::__construct();
		}
		
		public function errorCode(): string
		{
			return 'learning_support_team_category_not_exist';
		}
		
		protected function errorMessage(): string
		{
			return sprintf('The job designation <%s> does not exist', $this->id);
		}
	}