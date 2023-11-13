<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeamCategory\Infrastructure\UserInterface\Web;

use App\Backoffice\LearningSupportTeamCategory\Application\Get\Single\CheckLearningSupportTeamCategoryNameAvailability;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

final class LearningSupportTeamCategoryNameAvailableController extends WebController
{
    public function __invoke(
        Request $request,
        CheckLearningSupportTeamCategoryNameAvailability $checkLearningSupportTeamCategoryNameAvailability
    ): JsonResponse {
        return new JsonResponse(
            $checkLearningSupportTeamCategoryNameAvailability->__invoke($request->get('name', ''))
        );
    }
}
