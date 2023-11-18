<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeamCategory\Infrastructure\UserInterface\Web;

use App\Backoffice\LearningSupportTeamCategory\Application\Delete\LearningSupportTeamCategoryDeleter;
use App\Backoffice\LearningSupportTeamCategory\Domain\Exception\CannotDeleteCategoryWithRelatedLearningSupportTeams;
use App\Shared\Infrastructure\Symfony\WebController;
use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class LearningSupportTeamCategoryDeleteController extends WebController
{
    public function __invoke(Request $request, LearningSupportTeamCategoryDeleter $deleter, ValidationRulesToDelete $rulesToDelete): JsonResponse
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

    private function delete(LearningSupportTeamCategoryDeleter $deleter, string $id): JsonResponse
    {
        try {
            $deleter->__invoke($id);
            return $this->jsonResponseSuccess();
        } catch (CannotDeleteCategoryWithRelatedLearningSupportTeams $exception) {
            return $this->jsonResponseFail(
                $this->translator->trans($exception->getMessage())
            );
        }
    }
}
