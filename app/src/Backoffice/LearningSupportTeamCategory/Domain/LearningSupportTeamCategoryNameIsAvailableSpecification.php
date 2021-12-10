<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Domain;
	
	class LearningSupportTeamCategoryNameIsAvailableSpecification
	{
		private LearningSupportTeamCategoryRepository $repository;
		
		public function __construct(LearningSupportTeamCategoryRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function isSatisfiedBy(LearningSupportTeamCategory $learningSupportTeamCategory): bool
		{
			return $this->repository->isAvailable(array('name' => $learningSupportTeamCategory->name()));
		}
	}