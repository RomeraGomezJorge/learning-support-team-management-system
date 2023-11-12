<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;

use App\Backoffice\OfficeOfLearningSupport\Application\Get\Single\OfficeOfLearningSupportFinder;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web\TwigTemplateConstants as DistrictTwigTemplateConstants;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\RelatedEntities;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class OfficeOfLearningSupportEditController extends WebController
{

    public function __invoke(
        FlashSession                  $flashSession,
        Request                       $request,
        OfficeOfLearningSupportFinder $finder,
        RelatedEntities               $relatedEntities
    ): Response
    {
        $officeOfLearningSupport = $finder->__invoke($request->get('id'));

        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'page_title'                                               => TwigTemplateConstants::SECTION_TITLE,
            'list_path'                                                => TwigTemplateConstants::LIST_PATH,
            'id'                                                       => $officeOfLearningSupport->id(),
            'address'                                                  => $flashSession->get('inputs.address') ?? $officeOfLearningSupport->address(),
            'phone'                                                    => $flashSession->get('inputs.phone') ?? $officeOfLearningSupport->phone(),
            'office_of_learning_support_in_district_id'                => $flashSession->get('inputs.office_of_learning_support_in_district_id') ?? $officeOfLearningSupport->officeOfLearningSupportInDistrict()
                    ->id(),
            'districts'                                                => $relatedEntities->districtsSortedAlphabetically(),
            'add_office_of_learning_support_in_district_by_modal_path' => DistrictTwigTemplateConstants::ADD_OFFICE_OF_LEARNING_SUPPORT_IN_DISTRICT_BY_MODAL_PATH,
            'form_action_attribute'                                    => TwigTemplateConstants::UPDATE_PATH,
            'submit_button_label'                                      => FormConstant::SUBMIT_BUTTON_VALUE_TO_UPDATE,
            'action_to_do'                                             => FormConstant::UPDATE_LABEL_TEXT,
        ]);
    }

}
