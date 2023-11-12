<?php

declare(strict_types=1);


namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;

use App\Backoffice\EmploymentContract\Application\Get\Single\CheckEmploymentContractNameAvailability;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

final class EmploymentContractNameAvailableController extends WebController
{
    public function __invoke(
        Request                                 $request,
        CheckEmploymentContractNameAvailability $checkEmploymentContractNameAvailability
    ): JsonResponse
    {
        return new JsonResponse(
            $checkEmploymentContractNameAvailability->__invoke($request->get('name', ''))
        );
    }
}