<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;

use App\Backoffice\OfficeOfLearningSupport\Application\Delete\OfficeOfLearningSupportDeleter;
use App\Backoffice\OfficeOfLearningSupport\Domain\Exception\UnableDeleteOfficeContractWithAssociatedTeams;
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

        return ($validationErrors->count() !== 0)
            ? $this->jsonResponseUnexpectedErrorOnDelete()
            : $this->delete($deleter, $request->get('id'));
    }

    private function delete(OfficeOfLearningSupportDeleter $deleter, string $id): JsonResponse
    {
        try {
            $deleter->__invoke($id);
            return $this->jsonResponseSuccess();
        } catch ( UnableDeleteOfficeContractWithAssociatedTeams $exception) {
            return $this->jsonResponseFail($exception->getMessage());
        }
    }
}
