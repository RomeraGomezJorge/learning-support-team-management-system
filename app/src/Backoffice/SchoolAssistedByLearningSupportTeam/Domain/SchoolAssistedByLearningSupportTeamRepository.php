<?php

declare(strict_types=1);

namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain;

use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\ValueObject\Uuid;

interface SchoolAssistedByLearningSupportTeamRepository
{
    public function save(SchoolAssistedByLearningSupportTeam $schoolsAssistedByLearningSupportTeam): void;

    public function search(Uuid $id): ?SchoolAssistedByLearningSupportTeam;

    public function searchAll(): array;

    public function matching(Criteria $criteria, ?LearningSupportTeam $learningSupportTeam): array;

    public function totalMatchingRows(Criteria $criteria, ?LearningSupportTeam $learningSupportTeam): int;

    public function delete(SchoolAssistedByLearningSupportTeam $schoolsAssistedByLearningSupportTeam): void;
}
