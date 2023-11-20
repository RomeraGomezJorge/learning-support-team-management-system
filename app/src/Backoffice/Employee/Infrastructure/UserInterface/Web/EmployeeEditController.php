<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
use App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web\TwigTemplateConstants as TeamTwigTemplateConstants;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\RelatedEntities;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class EmployeeEditController extends WebController
{
    public function __invoke(
        Request $request,
        EmployeeFinder $finder,
        RelatedEntities $relatedEntities,
        FlashSession $flashSession
    ): Response {
        $employee = $finder->__invoke($request->get('id'));

        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'page_title'                        => TwigTemplateConstants::SECTION_TITLE,
            'list_path'                         => TwigTemplateConstants::LIST_PATH,
            'id'                                => $employee->id(),
            'name'                              => $flashSession->get('inputs.name') ?? $employee->name(),
            'surname'                           => $flashSession->get('inputs.surname') ?? $employee->surname(),
            'identity_card'                     => $flashSession->get('inputs.identity_card') ?? $employee->identityCard(),
            'phone'                             => $flashSession->get('inputs.phone') ?? $employee->phone(),
            'email'                             => $flashSession->get('inputs.phone') ?? $employee->email(),
            'hire_date'                         => $flashSession->get('inputs.hire_date') ?? $employee->hireDate(),
            'termination_date'                  => $flashSession->get('inputs.termination_date') ?? $employee->terminationDate(),
            'address'                           => $flashSession->get('inputs.address') ?? $employee->address(),
            'job_designation_id'                => $flashSession->get('inputs.job_designation_id') ?? $employee->jobDesignation()->id(),
            'employment_contract_id'            => $flashSession->get('inputs.employment_contract_id') ?? $employee->employmentContract()->id(),
            'shift_work'                        => $flashSession->get('inputs.shift_work') ?? $employee->shiftWork(),
            'birthday'                          => $flashSession->get('inputs.birthday') ?? $employee->birthday(),
            'learning_support_team'             => $employee->learningSupportTeams(),
            'documents'                         => $employee->documents(),
            'job_designations'                  => $relatedEntities->jobDesignationsSortedAlphabetically(),
            'employment_contracts'              => $relatedEntities->employmentContractsSortedAlphabetically(),
            'shifts_work'                       => TwigTemplateConstants::SHIFT_WORK_NAMES,
            'search_learning_support_team_path' => TeamTwigTemplateConstants::SEARCH_PATH,
            'attachment_file_directory'         => $this->getParameter('document_attachment_directory'),
            'form_action_attribute'             => TwigTemplateConstants::UPDATE_PATH,
            'submit_button_label'               => FormConstant::SUBMIT_BUTTON_VALUE_TO_UPDATE,
            'action_to_do'                      => FormConstant::UPDATE_LABEL_TEXT,
        ]);
    }
}
