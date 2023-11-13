<?php

  declare(strict_types=1);

namespace App\Backoffice\Employee\Application\Delete;

use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
use App\Backoffice\Employee\Domain\EmployeeRepository;

final class EmployeeDeleter
{
    private EmployeeRepository $repository;

    private EmployeeFinder $finder;

    public function __construct(EmployeeRepository $repository)
    {
        $this->repository = $repository;
        $this->finder     = new EmployeeFinder($repository);
    }

    public function __invoke(string $id)
    {
        $employee = $this->finder->__invoke($id);

        $this->repository->delete($employee);
    }
}
