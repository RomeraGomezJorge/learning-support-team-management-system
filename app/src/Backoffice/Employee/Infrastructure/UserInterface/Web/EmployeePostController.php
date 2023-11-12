<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Application\Post\EmployeeCreator;
use App\Shared\Infrastructure\Constant\MessageConstant;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class EmployeePostController extends WebController
{

    public function __invoke(
        Request                          $request,
        EmployeeCreator                  $creator,
        ValidationRulesToCreateAndUpdate $validationRules

    ): Response
    {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->redirectOnInvalidCsrfToken();
        }

        $validationErrors = $validationRules->verify($request);

        return $validationErrors->count() !== 0
            ? $this->redirectWithErrors(TwigTemplateConstants::CREATE_PATH, $validationErrors, $request)
            : $this->create($request, $creator);
    }

    private function create(
        Request         $request,
        EmployeeCreator $creator
    ): RedirectResponse
    {

        $creator->__invoke(
            $request->get('id'),
            $request->get('name'),
            $request->get('surname'),
            $request->get('identity_card') ?: NULL,
            $request->get('phone') ?: NULL,
            $request->get('email') ?: NULL,
            $request->get('hire_date') ?: NULL,
            $request->get('termination_date') ?: NULL,
            $request->get('address') ?: NULL,
            $request->get('job_designation_id'),
            $request->get('employment_contract_id'),
            $request->get('shift_work'),
            $request->get('learning_support_team'),
            $request->get('birthday') ?: NULL
        );

        return $this->redirectWithMessage(
            TwigTemplateConstants::LIST_PATH,
            MessageConstant::SUCCESS_MESSAGE_TO_CREATE
        );
    }

}
