<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Application\Get\Single;
	
	use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
	
	final class CheckLearningSupportTeamNameAvailability
	{
		private LearningSupportTeamRepository $repository;
		
		public function __construct(LearningSupportTeamRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $name): bool
		{
			return $this->repository->isAvailable(['name' => $name]);
		}
	}