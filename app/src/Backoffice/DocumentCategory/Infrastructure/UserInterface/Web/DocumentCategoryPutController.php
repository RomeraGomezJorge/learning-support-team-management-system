<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;

use App\Backoffice\DocumentCategory\Application\Put\DocumentCategoryChangerDetails;
use App\Shared\Infrastructure\Constant\MessageConstant;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DocumentCategoryPutController extends WebController
{
    public function __invoke(
        Request $request,
        DocumentCategoryChangerDetails $updater,
        ValidationRulesToCreateAndUpdate $validationRules
    ): Response {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->redirectOnInvalidCsrfToken();
        }

        $validationErrors = $validationRules->verify($request);

        return ($validationErrors->count() !== 0)
            ? $this->redirectWithErrors(TwigTemplateConstants::EDIT_PATH, $validationErrors, $request)
            : $this->update($request, $updater);
    }

    private function update(Request $request, DocumentCategoryChangerDetails $updater): RedirectResponse
    {
        $updater->__invoke($request->get('id'), $request->get('name'));

        return $this->redirectWithMessage(
            TwigTemplateConstants::LIST_PATH,
            MessageConstant::SUCCESS_MESSAGE_TO_UPDATE
        );
    }
}
