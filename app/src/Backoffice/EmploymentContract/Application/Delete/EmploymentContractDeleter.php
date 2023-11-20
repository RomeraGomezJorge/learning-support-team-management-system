<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Application\Delete;

use App\Backoffice\Employee\Domain\Exception\UnableDeleteEmploymentContractWithAssociatedEmployees;
use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;

final class EmploymentContractDeleter
{
    private EmploymentContractRepository $repository;
    private EmploymentContractFinder $finder;

    public function __construct(
        EmploymentContractRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new EmploymentContractFinder($repository);
    }

    public function __invoke(string $id)
    {
        $employmentContract = $this->finder->__invoke($id);

        if ($employmentContract->hasEmployees()) {
            throw new UnableDeleteEmploymentContractWithAssociatedEmployees();
        }

        $this->repository->delete($employmentContract);
    }
}
