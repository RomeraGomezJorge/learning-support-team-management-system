<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Single;
	
	use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeam;
	use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
	use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\Exception\SchoolAssistedByLearningSupportTeamNotExist;
	use App\Shared\Domain\ValueObject\Uuid;
	
	final class SchoolAssistedByLearningSupportTeamFinder
	{
		const NOT_FOUND = null;
		private SchoolAssistedByLearningSupportTeamRepository $repository;
		
		public function __construct(SchoolAssistedByLearningSupportTeamRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $id): SchoolAssistedByLearningSupportTeam
		{
			$id = new Uuid($id);
			
			$schoolsAssistedByLearningSupportTeam = $this->repository->search($id);
			
			if (self::NOT_FOUND === $schoolsAssistedByLearningSupportTeam) {
				throw new SchoolAssistedByLearningSupportTeamNotExist(($id)->value());
			}
			
			return $schoolsAssistedByLearningSupportTeam;
		}
	}