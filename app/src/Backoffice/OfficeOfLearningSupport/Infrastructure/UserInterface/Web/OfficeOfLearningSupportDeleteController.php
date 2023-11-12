<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;

use App\Backoffice\OfficeOfLearningSupport\Application\Delete\OfficeOfLearningSupportDeleter;
use App\Shared\Infrastructure\Constant\MessageConstant;
use App\Shared\Infrastructure\Symfony\WebController;
use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class OfficeOfLearningSupportDeleteController extends WebController
{
    public function __invoke(Request $request, OfficeOfLearningSupportDeleter $deleter, ValidationRulesToDelete $rulesToDelete): JsonResponse
    {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        $validationErrors = $rulesToDelete->verify($request);

        $response = $validationErrors->count() !== 0
            ? ['status' => 'fail', 'message' => MessageConstant::UNEXPECTED_ERROR_HAS_OCCURRED]
            : $this->delete($deleter, $request->get('id'));

        return new JsonResponse($response);
    }

    private function delete(OfficeOfLearningSupportDeleter $deleter, string $id): array
    {
        $deleter->__invoke($id);

        return ['status' => 'success'];
    }
}
	
