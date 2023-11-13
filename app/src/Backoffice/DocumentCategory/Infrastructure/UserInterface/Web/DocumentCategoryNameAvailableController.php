<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;

use App\Backoffice\DocumentCategory\Application\Get\Single\CheckDocumentCategoryNameAvailability;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

final class DocumentCategoryNameAvailableController extends WebController
{
    public function __invoke(
        Request $request,
        CheckDocumentCategoryNameAvailability $checkDocumentCategoryNameAvailability
    ): JsonResponse {
        return new JsonResponse(
            $checkDocumentCategoryNameAvailability->__invoke($request->get('name', ''))
        );
    }
}
