<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Application\Get\Collection;

use App\Backoffice\Employee\Domain\EmployeeRepository;
use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
use App\Backoffice\JobDesignation\Application\Get\Single\JobDesignationFinder;
use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
use App\Shared\Application\Get\Collection\GetEntityAndRemoveFromFilterOrNull;
use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\Criteria\Filters;
use App\Shared\Domain\Criteria\Order;

final class EmployeeByCriteriaCounter
{
    private EmployeeRepository $repository;

    private JobDesignationFinder $jobDesignationFinder;

    private EmploymentContractFinder $employmentContractFinder;

    private LearningSupportTeamFinder $learningSupportTeamFinder;

    private GetEntityAndRemoveFromFilterOrNull $getEntityAndRemoveFromFilterOrNull;

    public function __construct(
        EmployeeRepository $repository,
        JobDesignationRepository $jobDesignationRepository,
        EmploymentContractRepository $employmentContractRepository,
        LearningSupportTeamRepository $learningSupportTeamRepository,
        GetEntityAndRemoveFromFilterOrNull $getEntityAndRemoveFromFilterOrNull
    ) {
        $this->repository                         = $repository;
        $this->jobDesignationFinder               = new JobDesignationFinder($jobDesignationRepository);
        $this->employmentContractFinder           = new EmploymentContractFinder($employmentContractRepository);
        $this->learningSupportTeamFinder          = new LearningSupportTeamFinder($learningSupportTeamRepository);
        $this->getEntityAndRemoveFromFilterOrNull = $getEntityAndRemoveFromFilterOrNull;
    }

    public function __invoke($filters, $order, $orderBy, ?int $limit, ?int $offset): int
    {

        $jobDesignation = $this->getEntityAndRemoveFromFilterOrNull->__invoke(
            $filters,
            $this->jobDesignationFinder,
            'jobDesignation'
        );

        $employmentContract = $this->getEntityAndRemoveFromFilterOrNull->__invoke(
            $filters,
            $this->employmentContractFinder,
            'employmentContract'
        );

        $learningSupportTeam = $this->getEntityAndRemoveFromFilterOrNull->__invoke(
            $filters,
            $this->learningSupportTeamFinder,
            'learningSupportTeam'
        );

        $filters = Filters::fromValues($filters);

        $order = Order::fromValues($order, $orderBy);

        $criteria = new Criteria($filters, $order, $offset, $limit);

        return $this->repository->totalMatchingRows($criteria, $jobDesignation, $employmentContract, $learningSupportTeam);
    }
}
