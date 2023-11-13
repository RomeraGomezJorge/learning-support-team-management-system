<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Application\Get\Single;

use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
use App\Backoffice\EmploymentContract\Domain\Exception\EmploymentContractNotExist;
use App\Shared\Application\Get\Collection\Finder;
use App\Shared\Domain\ValueObject\Uuid;

final class EmploymentContractFinder implements Finder
{
    private const NOT_FOUND = null;
    private EmploymentContractRepository $repository;

    public function __construct(EmploymentContractRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke(string $id): EmploymentContract
    {
        $id = new Uuid($id);

        $EmploymentContract = $this->repository->search($id);

        if (self::NOT_FOUND === $EmploymentContract) {
            throw new EmploymentContractNotExist(($id)->value());
        }

        return $EmploymentContract;
    }
}
