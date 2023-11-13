<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Application\Delete;

use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;

final class LearningSupportTeamDeleter
{
    private LearningSupportTeamRepository $repository;
    private LearningSupportTeamFinder $finder;

    public function __construct(
        LearningSupportTeamRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new LearningSupportTeamFinder($repository);
    }

    public function __invoke(string $id)
    {
        $learningSupportTeam = $this->finder->__invoke($id);

        $this->repository->delete($learningSupportTeam);
    }
}
