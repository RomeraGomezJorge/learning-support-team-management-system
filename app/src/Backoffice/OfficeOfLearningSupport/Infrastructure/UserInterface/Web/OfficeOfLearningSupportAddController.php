<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;

use App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web\TwigTemplateConstants as DistrictTwigTemplateConstants;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\RamseyUuidGenerator;
use App\Shared\Infrastructure\RelatedEntities;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Response;

class OfficeOfLearningSupportAddController extends WebController
{
    public function __invoke(
        FlashSession $flashSession,
        RamseyUuidGenerator $ramseyUuidGenerator,
        RelatedEntities $relatedEntities
    ): Response {
        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'list_path'                                                => TwigTemplateConstants::LIST_PATH,
            'page_title'                                               => TwigTemplateConstants::SECTION_TITLE,
            'id'                                                       => $ramseyUuidGenerator->generate(),
            'add_office_of_learning_support_in_district_by_modal_path' => DistrictTwigTemplateConstants::ADD_OFFICE_OF_LEARNING_SUPPORT_IN_DISTRICT_BY_MODAL_PATH,
            'address'                                                  => $flashSession->get('inputs.address'),
            'phone'                                                    => $flashSession->get('inputs.phone'),
            'office_of_learning_support_in_district_id'                => $flashSession->get('inputs.office_of_learning_support_in_district_id'),
            'districts'                                                => $relatedEntities->districtsSortedAlphabetically(),
            'form_action_attribute'                                    => TwigTemplateConstants::CREATE_PATH,
            'submit_button_label'                                      => FormConstant::SUBMIT_BUTTON_VALUE_TO_CREATE,
            'action_to_do'                                             => FormConstant::CREATE_LABEL_TEXT,
        ]);
    }
}
