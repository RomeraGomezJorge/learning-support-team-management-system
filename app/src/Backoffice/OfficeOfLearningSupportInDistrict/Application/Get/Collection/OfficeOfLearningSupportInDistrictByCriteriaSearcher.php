<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Collection;

use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;
use App\Shared\Domain\Criteria\Criteria;
use App\Shared\Domain\Criteria\Filters;
use App\Shared\Domain\Criteria\Order;

final class OfficeOfLearningSupportInDistrictByCriteriaSearcher
{
    private OfficeOfLearningSupportInDistrictRepository $repository;

    public function __construct(OfficeOfLearningSupportInDistrictRepository $repository)
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
