<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;

use App\Backoffice\DocumentCategory\Application\Delete\DocumentCategoryDeleter;
use App\Backoffice\DocumentCategory\Domain\Exception\UnableDeleteCategoryWithAssociatedDocuments;
use App\Shared\Infrastructure\Symfony\WebController;
use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class DocumentCategoryDeleteController extends WebController
{
    public function __invoke(
        Request $request,
        DocumentCategoryDeleter $deleter,
        ValidationRulesToDelete $rulesToDelete
    ): JsonResponse {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        $validationErrors = $rulesToDelete->verify($request);

        return ($validationErrors->count() !== 0)
            ? $this->jsonResponseUnexpectedErrorOnDelete()
            : $this->delete($deleter, $request->get('id'));
    }

    private function delete(DocumentCategoryDeleter $deleter, string $id): JsonResponse
    {
        try {
            $deleter->__invoke($id);
            return $this->jsonResponseSuccess();
        } catch (UnableDeleteCategoryWithAssociatedDocuments $exception) {
            return $this->jsonResponseFail($exception->getMessage());
        }
    }
}
