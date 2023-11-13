<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Domain;

use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\ValueObject\Uuid;

interface JobDesignationRepository
{
    public function save(JobDesignation $jobDesignation): void;

    public function search(Uuid $id): ?JobDesignation;

    public function searchAll(): array;

    public function matching(Criteria $criteria): array;

    public function totalMatchingRows(Criteria $criteria): int;

    public function delete(JobDesignation $jobDesignation): void;

    public function isAvailable(array $criteria): bool;
}
