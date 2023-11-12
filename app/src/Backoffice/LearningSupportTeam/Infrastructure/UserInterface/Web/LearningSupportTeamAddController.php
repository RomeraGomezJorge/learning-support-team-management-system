<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;

use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web\TwigTemplateConstants as SchoolTwigTemplateConstants;
use App\Backoffice\Employee\Infrastructure\UserInterface\Web\TwigTemplateConstants as EmployeeTwigTemplateConstants;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\RamseyUuidGenerator;
use App\Shared\Infrastructure\RelatedEntities;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Response;


class LearningSupportTeamAddController extends WebController
{
    public function __invoke(
        FlashSession                      $flashSession,
        RamseyUuidGenerator               $ramseyUuidGenerator,
        OfficeOfLearningSupportRepository $officeOfLearningSupportRepository,
        RelatedEntities                   $relatedEntities
    ): Response
    {
        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'list_path'                                                 => TwigTemplateConstants::LIST_PATH,
            'page_title'                                                => TwigTemplateConstants::SECTION_TITLE,
            'id'                                                        => $ramseyUuidGenerator->generate(),
            'name_available_path'                                       => TwigTemplateConstants::NAME_AVAILABLE_PATH,
            'name'                                                      => $flashSession->get('inputs.name'),
            'manager'                                                   => $flashSession->get('inputs.manager'),
            'office_learning_support_id'                                => $flashSession->get('inputs.learning_support_team_category_id'),
            'learning_support_team_category_id'                         => $flashSession->get('inputs.learning_support_team_category_id'),
            'learning_support_team_categories'                          => $relatedEntities->learningSupportTeamCategoriesSortedAlphabetically(),
            'add_school_assisted_by_learning_support_team_add_by_modal' => SchoolTwigTemplateConstants::ADD_SCHOOL_BY_MODAL_PATH,
            'search_school_path'                                        => SchoolTwigTemplateConstants::SEARCH_SCHOOL_PATH,
            'search_employee_path'                                      => EmployeeTwigTemplateConstants::SEARCH_PATH,
            'form_action_attribute'                                     => TwigTemplateConstants::CREATE_PATH,
            'offices_learning_support'                                  => $officeOfLearningSupportRepository->getAllSortedAlphabeticallyByDistrict(),
            'submit_button_label'                                       => FormConstant::SUBMIT_BUTTON_VALUE_TO_CREATE,
            'action_to_do'                                              => FormConstant::CREATE_LABEL_TEXT,
        ]);
    }
}
