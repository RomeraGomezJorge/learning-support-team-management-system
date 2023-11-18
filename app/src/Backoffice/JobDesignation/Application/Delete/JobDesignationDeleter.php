<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Application\Delete;

use App\Backoffice\JobDesignation\Application\Get\Single\JobDesignationFinder;
use App\Backoffice\JobDesignation\Domain\Exception\CannotDeleteJobDesignationWithRelatedEmployees;
use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;

final class JobDesignationDeleter
{
    private JobDesignationRepository $repository;
    private JobDesignationFinder $finder;

    public function __construct(
        JobDesignationRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new JobDesignationFinder($repository);
    }

    public function __invoke(string $id)
    {
        $jobDesignation = $this->finder->__invoke($id);

        if ($jobDesignation->hasEmployees()) {
            throw new CannotDeleteJobDesignationWithRelatedEmployees();
        }

        $this->repository->delete($jobDesignation);
    }
}
