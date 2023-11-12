<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;

use App\Backoffice\LearningSupportTeam\Application\Post\LearningSupportTeamCreator;
use App\Shared\Infrastructure\Constant\MessageConstant;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class LearningSupportTeamPostController extends WebController
{

    public function __invoke(
        Request                          $request,
        LearningSupportTeamCreator       $creator,
        ValidationRulesToCreateAndUpdate $validationsRules
    ): Response
    {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->redirectOnInvalidCsrfToken();
        }

        $validationErrors = $validationsRules->verify($request);

        return $validationErrors->count() !== 0
            ? $this->redirectWithErrors(TwigTemplateConstants::CREATE_PATH, $validationErrors, $request)
            : $this->create($request, $creator);
    }

    private function create(
        Request                    $request,
        LearningSupportTeamCreator $creator
    ): RedirectResponse
    {
        $creator->__invoke(
            $request->get('id'),
            $request->get('name'),
            $request->get('manager') ?: NULL,
            $request->get('office_learning_support_id'),
            $request->get('schools_assisted_by_learning_support_team') ?: NULL,
            $request->get('learning_support_team_category_id')
        );

        return $this->redirectWithMessage(
            TwigTemplateConstants::LIST_PATH,
            MessageConstant::SUCCESS_MESSAGE_TO_CREATE
        );
    }

}
