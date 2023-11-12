<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeamCategory\Application\Put;

use App\Backoffice\LearningSupportTeamCategory\Application\Get\Single\LearningSupportTeamCategoryFinder;
use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryNameIsAvailableSpecification;
use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;
use App\Backoffice\LearningSupportTeamCategory\Domain\ValueObject\LearningSupportTeamCategoryName;

final class LearningSupportTeamCategoryChangerDetails
{

    private LearningSupportTeamCategoryRepository $repository;
    private LearningSupportTeamCategoryFinder $finder;
    private LearningSupportTeamCategoryNameIsAvailableSpecification $nameIsAvailableSpecification;

    public function __construct(
        LearningSupportTeamCategoryRepository                   $repository,
        LearningSupportTeamCategoryNameIsAvailableSpecification $nameIsAvailableSpecification
    )
    {
        $this->repository                   = $repository;
        $this->finder                       = new LearningSupportTeamCategoryFinder($repository);
        $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
    }

    public function __invoke(string $id, string $newName): void
    {

        $learningSupportTeamCategory = $this->finder->__invoke($id);

        $learningSupportTeamCategory->changeDetails(
            new LearningSupportTeamCategoryName($newName),
            $this->nameIsAvailableSpecification
        );

        $this->repository->save($learningSupportTeamCategory);
    }
}