<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;

use App\Backoffice\EmploymentContract\Application\Delete\EmploymentContractDeleter;
use App\Shared\Infrastructure\Symfony\WebController;
use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class EmploymentContractDeleteController extends WebController
{
    public function __invoke(Request $request, EmploymentContractDeleter $deleter, ValidationRulesToDelete $rulesToDelete): JsonResponse
    {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        $validationErrors = $rulesToDelete->verify($request);

        return ($validationErrors->count() !== 0)
            ? $this->jsonResponseUnexpectedError()
            : $this->delete($deleter, $request->get('id'));
    }

    private function delete(EmploymentContractDeleter $deleter, string $id): JsonResponse
    {
        $deleter->__invoke($id);

        return $this->jsonResponseSuccess();
    }
}
