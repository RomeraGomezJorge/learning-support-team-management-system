<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeamCategory\Application\Delete;

use App\Backoffice\LearningSupportTeamCategory\Application\Get\Single\LearningSupportTeamCategoryFinder;
use App\Backoffice\LearningSupportTeamCategory\Domain\Exception\CannotDeleteCategoryWithRelatedLearningSupportTeams;
use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;

final class LearningSupportTeamCategoryDeleter
{
    private LearningSupportTeamCategoryRepository $repository;
    private LearningSupportTeamCategoryFinder $finder;

    public function __construct(
        LearningSupportTeamCategoryRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new LearningSupportTeamCategoryFinder($repository);
    }

    public function __invoke(string $id)
    {
        $learningSupportTeamCategory = $this->finder->__invoke($id);

        if ($learningSupportTeamCategory->hasLearningSupportTeams()) {
            throw new CannotDeleteCategoryWithRelatedLearningSupportTeams();
        }

        $this->repository->delete($learningSupportTeamCategory);
    }
}
