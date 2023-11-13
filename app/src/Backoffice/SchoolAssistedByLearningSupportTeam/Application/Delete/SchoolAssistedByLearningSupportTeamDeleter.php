<?php

declare(strict_types=1);

namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Delete;

use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Single\SchoolAssistedByLearningSupportTeamFinder;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;

final class SchoolAssistedByLearningSupportTeamDeleter
{
    private SchoolAssistedByLearningSupportTeamRepository $repository;
    private SchoolAssistedByLearningSupportTeamFinder $finder;

    public function __construct(
        SchoolAssistedByLearningSupportTeamRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new SchoolAssistedByLearningSupportTeamFinder($repository);
    }

    public function __invoke(string $id)
    {
        $schoolsAssistedByLearningSupportTeam = $this->finder->__invoke($id);

        $this->repository->delete($schoolsAssistedByLearningSupportTeam);
    }
}
