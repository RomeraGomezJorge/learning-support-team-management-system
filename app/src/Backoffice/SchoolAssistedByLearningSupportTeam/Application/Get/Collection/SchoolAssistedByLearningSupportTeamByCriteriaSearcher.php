<?php

  declare(strict_types=1);

  namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Collection;

  use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
  use App\Shared\Application\Get\Collection\GetEntityAndRemoveFromFilterOrNull;
  use App\Shared\Domain\Criteria\Criteria;
  use App\Shared\Domain\Criteria\Filters;
  use App\Shared\Domain\Criteria\Order;

  final class SchoolAssistedByLearningSupportTeamByCriteriaSearcher
{
    private SchoolAssistedByLearningSupportTeamRepository $repository;

    private LearningSupportTeamFinder $learningSupportTeamFinder;

    private GetEntityAndRemoveFromFilterOrNull $getEntityAndRemoveFromFilterOrNull;

    public function __construct(
        SchoolAssistedByLearningSupportTeamRepository $repository,
        LearningSupportTeamRepository $learningSupportTeamRepository,
        GetEntityAndRemoveFromFilterOrNull $getEntityAndRemoveFromFilterOrNull
    ) {
        $this->repository                         = $repository;
        $this->learningSupportTeamFinder          = new LearningSupportTeamFinder($learningSupportTeamRepository);
        $this->getEntityAndRemoveFromFilterOrNull = $getEntityAndRemoveFromFilterOrNull;
    }

    public function __invoke(
        $filters,
        $order,
        $orderBy,
        ?int $limit,
        ?int $offset
    ): array {

        $learningSupportTeam = $this->getEntityAndRemoveFromFilterOrNull->__invoke(
            $filters,
            $this->learningSupportTeamFinder,
            'learningSupportTeam'
        );

        $filters = Filters::fromValues($filters);

        $order = Order::fromValues($order, $orderBy);

        $criteria = new Criteria($filters, $order, $offset, $limit);

        return $this->repository->matching($criteria, $learningSupportTeam);
    }
}
