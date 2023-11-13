<?php

  declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web\TwigTemplateConstants as TeamTwigTemplateConstants;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\RamseyUuidGenerator;
use App\Shared\Infrastructure\RelatedEntities;
use App\Shared\Infrastructure\RenderFormInterface;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;

final class FormToCreateEmployeeByAjax extends WebController implements RenderFormInterface
{
    private RamseyUuidGenerator $ramseyUuidGenerator;

    private FlashSession $flashSession;

    private RelatedEntities $relatedEntities;

    public function __construct(
        RamseyUuidGenerator $ramseyUuidGenerator,
        FlashSession $flashSession,
        RelatedEntities $relatedEntities
    ) {
        $this->ramseyUuidGenerator = $ramseyUuidGenerator;
        $this->flashSession        = $flashSession;
        $this->relatedEntities     = $relatedEntities;
    }

    public function __invoke(): ?string
    {
        return $this->render(TwigTemplateConstants::CREATE_BY_AJAX_FILE_PATH, [
            'id'                                => $this->ramseyUuidGenerator->generate(),
            'name'                              => $this->flashSession->get('inputs.name'),
            'surname'                           => $this->flashSession->get('inputs.surname'),
            'identity_card'                     => $this->flashSession->get('inputs.identity_card'),
            'job_designation_id'                => $this->flashSession->get('inputs.job_designation_id'),
            'employment_contract_id'            => $this->flashSession->get('inputs.employment_contract_id'),
            'shift_work'                        => $this->flashSession->get('inputs.shift_work'),
            'learning_support_team'             => $this->flashSession->get('inputs.learning_support_team'),
            'job_designations'                  => $this->relatedEntities->jobDesignationsSortedAlphabetically(),
            'employment_contracts'              => $this->relatedEntities->employmentContractsSortedAlphabetically(),
            'shifts_work'                       => TwigTemplateConstants::SHIFT_WORK_NAMES,
            'search_learning_support_team_path' => TeamTwigTemplateConstants::SEARCH_PATH,
            'form_action_attribute'             => TwigTemplateConstants::CREATE_BY_AJAX_PATH,
            'submit_button_label'               => FormConstant::SUBMIT_BUTTON_VALUE_TO_CREATE,
            'action_to_do'                      => FormConstant::CREATE_LABEL_TEXT,
        ])->getContent();
    }
}
