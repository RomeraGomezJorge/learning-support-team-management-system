<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;

use App\Backoffice\DocumentCategory\Application\Post\DocumentCategoryCreator;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

class DocumentCategoryPostByAjaxController extends WebController
{
    public function __invoke(
        Request $request,
        DocumentCategoryCreator $documentCategoryCreator,
        FormToCreateADocumentCategoryByAjax $formToCreateDocumentCategoryByAjax
    ): JsonResponse {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        $validationErrors = $this->validateRequest($request);

        return ($validationErrors->count() !== 0)
            ? $this->jsonResponseValidationErrors($formToCreateDocumentCategoryByAjax, $validationErrors, $request)
            : $this->createDocumentCategory($request, $documentCategoryCreator);
    }

    private function validateRequest(Request $request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'                                    => [new Assert\Uuid()],
                'name'                                  => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
                'select_this_document_category_on_save' => [new Assert\Optional()],
                'csrf_token'                            => [new Assert\NotBlank()],
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }

    private function createDocumentCategory(
        Request $request,
        DocumentCategoryCreator $documentCategoryCreator
    ): JsonResponse {
        $documentCategoryCreator->__invoke(
            $request->get('id'),
            $request->get('name')
        );

        return $this->jsonResponseSuccess();
    }
}
