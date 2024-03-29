<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Application\Delete\EmployeeDeleter;
use App\Backoffice\Employee\Domain\Exception\UnableDeleteManagerWithAssociatedLearningSupportTeam;
use App\Shared\Infrastructure\Symfony\WebController;
use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class EmployeeDeleteController extends WebController
{
    public function __invoke(
        Request $request,
        EmployeeDeleter $deleter,
        ValidationRulesToDelete $rulesToDelete
    ): JsonResponse {
        $isCsrfTokenValid = $this->isCsrfTokenValid(
            $request->get('id'),
            $request->get('csrf_token')
        );

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        $validationErrors = $rulesToDelete->verify($request);

        return ($validationErrors->count() !== 0)
            ? $this->jsonResponseUnexpectedErrorOnDelete()
            : $this->delete($deleter, $request->get('id'));
    }

    private function delete(EmployeeDeleter $deleter, string $id): JsonResponse
    {

        try {
            $deleter->__invoke($id);
            return $this->jsonResponseSuccess();
        } catch (UnableDeleteManagerWithAssociatedLearningSupportTeam $exception) {
            return $this->jsonResponseFail($exception->getMessage());
        }
    }
}
