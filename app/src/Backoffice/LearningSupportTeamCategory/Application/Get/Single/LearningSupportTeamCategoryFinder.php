<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Application\Get\Single;
	
	use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategory;
	use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;
	use App\Backoffice\LearningSupportTeamCategory\Domain\Exception\LearningSupportTeamCategoryNotExist;
	use App\Shared\Domain\ValueObject\Uuid;
	
	final class LearningSupportTeamCategoryFinder
	{
		const NOT_FOUND = null;
		private LearningSupportTeamCategoryRepository $repository;
		
		public function __construct(LearningSupportTeamCategoryRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $id): LearningSupportTeamCategory
		{
			$id = new Uuid($id);
			
			$learningSupportTeamCategory = $this->repository->search($id);
			
			if (self::NOT_FOUND === $learningSupportTeamCategory) {
				throw new LearningSupportTeamCategoryNotExist(($id)->value());
			}
			
			return $learningSupportTeamCategory;
		}
	}