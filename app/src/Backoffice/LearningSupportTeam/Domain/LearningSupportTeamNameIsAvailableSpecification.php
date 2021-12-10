<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Domain;
	
	class LearningSupportTeamNameIsAvailableSpecification
	{
		private LearningSupportTeamRepository $repository;
		
		public function __construct(LearningSupportTeamRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function isSatisfiedBy(LearningSupportTeam $learningSupportTeam): bool
		{
			return $this->repository->isAvailable(array('name' => $learningSupportTeam->name()));
		}
	}