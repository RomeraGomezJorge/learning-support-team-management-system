<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Infrastructure\UserInterface\Web;

use App\Backoffice\JobDesignation\Application\Get\Single\CheckJobDesignationNameAvailability;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

final class JobDesignationNameAvailableController extends WebController
{
    public function __invoke(
        Request $request,
        CheckJobDesignationNameAvailability $checkJobDesignationNameAvailability
    ): JsonResponse {
        return new JsonResponse(
            $checkJobDesignationNameAvailability->__invoke($request->get('name', ''))
        );
    }
}
