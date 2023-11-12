<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Application\Get\Single;
	
	use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;
	
	final class CheckLearningSupportTeamCategoryNameAvailability
	{

        private LearningSupportTeamCategoryRepository $repository;
		
		public function __construct(LearningSupportTeamCategoryRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $name): bool
		{
			return $this->repository->isAvailable(['name' => $name]);
		}
	}