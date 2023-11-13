<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Application\Put;

use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractNameIsAvailableSpecification;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
use App\Backoffice\EmploymentContract\Domain\ValueObject\EmploymentContractName;

final class EmploymentContractChangerDetails
{
    private EmploymentContractRepository $repository;
    private EmploymentContractFinder $finder;
    private EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification;

    public function __construct(
        EmploymentContractRepository $repository,
        EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification
    ) {
        $this->repository                                     = $repository;
        $this->finder                                         = new EmploymentContractFinder($repository);
        $this->employmentContractNameIsAvailableSpecification = $employmentContractNameIsAvailableSpecification;
    }

    public function __invoke(string $id, string $newName): void
    {
        $employmentContract = $this->finder->__invoke($id);

        $employmentContract->changeDetails(
            new EmploymentContractName($newName),
            $this->employmentContractNameIsAvailableSpecification
        );

        $this->repository->save($employmentContract);
    }
}
