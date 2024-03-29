<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Domain;

use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\ValueObject\Uuid;

interface EmploymentContractRepository
{
    public function save(EmploymentContract $EmploymentContract): void;

    public function search(Uuid $id): ?EmploymentContract;

    public function searchAll(): array;

    public function matching(Criteria $criteria): array;

    public function totalMatchingRows(Criteria $criteria): int;

    public function delete(EmploymentContract $EmploymentContract): void;

    public function isAvailable(array $criteria): bool;
}
