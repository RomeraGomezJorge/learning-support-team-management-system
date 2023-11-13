<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Application\Get\Single;

use App\Backoffice\LearningSupportTeam\Domain\Exception\LearningSupportTeamNotExist;
use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
use App\Shared\Application\Get\Collection\Finder;
use App\Shared\Domain\ValueObject\Uuid;

final class LearningSupportTeamFinder implements Finder
{
    private const NOT_FOUND = null;
    private LearningSupportTeamRepository $repository;

    public function __construct(LearningSupportTeamRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke(string $id): LearningSupportTeam
    {
        $id = new Uuid($id);

        $learningSupportTeam = $this->repository->search($id);

        if (self::NOT_FOUND === $learningSupportTeam) {
            throw new LearningSupportTeamNotExist(($id)->value());
        }

        return $learningSupportTeam;
    }
}
