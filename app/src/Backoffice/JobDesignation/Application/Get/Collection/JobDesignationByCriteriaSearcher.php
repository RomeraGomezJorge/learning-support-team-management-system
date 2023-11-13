<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Application\Get\Collection;

use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\Criteria\Filters;
use App\Shared\Domain\Criteria\Order;

final class JobDesignationByCriteriaSearcher
{
    private JobDesignationRepository $repository;

    public function __construct(JobDesignationRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke($filters, $order, $orderBy, ?int $limit, ?int $offset): array
    {
        $filters = Filters::fromValues($filters);

        $order = Order::fromValues($order, $orderBy);

        $criteria = new Criteria($filters, $order, $offset, $limit);

        return $this->repository->matching($criteria);
    }
}
