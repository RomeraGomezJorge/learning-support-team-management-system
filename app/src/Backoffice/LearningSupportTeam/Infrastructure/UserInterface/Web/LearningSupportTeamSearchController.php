<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;

use App\Backoffice\LearningSupportTeam\Application\Get\Collection\LearningSupportTeamByCriteriaSearcher;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;


class LearningSupportTeamSearchController extends WebController
{
    const SORT_A_LIST_BY_NAME = 'name';
    const SORT_A_LIST_ALPHABETICALLY = 'asc';
    const LIST_BEGIN_ON_0 = 0;
    const LIST_END_ON_1000 = 1000;

    public function __invoke(
        Request                               $request,
        LearningSupportTeamByCriteriaSearcher $learningSupportTeamByCriteriaSearcher
    ): JsonResponse
    {
        $filters[0]['field']    = 'name';
        $filters[0]['operator'] = 'CONTAINS';
        $filters[0]['value']    = $request->get('name');

        $learningSupportTeam = $learningSupportTeamByCriteriaSearcher->__invoke(
            $filters,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0);

        return new JsonResponse(array_map(function ($learningSupportTeam) {
            return [
                'id'   => $learningSupportTeam->id(),
                'name' => $learningSupportTeam->name()
            ];
        }, $learningSupportTeam));

    }

}
	