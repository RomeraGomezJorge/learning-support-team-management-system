<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Application\Get\Collection;

use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\Criteria\Filters;
use App\Shared\Domain\Criteria\Order;

final class EmploymentContractByCriteriaCounter
{
    private EmploymentContractRepository $repository;

    public function __construct(EmploymentContractRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke($filters, $order, $orderBy, ?int $limit, ?int $offset): int
    {
        $filters = Filters::fromValues($filters);

        $order = Order::fromValues($order, $orderBy);

        $criteria = new Criteria($filters, $order, $offset, $limit);

        return $this->repository->totalMatchingRows($criteria);
    }
}
