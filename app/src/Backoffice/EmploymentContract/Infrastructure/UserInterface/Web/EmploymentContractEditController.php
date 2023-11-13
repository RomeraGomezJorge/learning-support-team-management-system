<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;

use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class EmploymentContractEditController extends WebController
{
    public function __invoke(
        FlashSession $flashSession,
        Request $request,
        EmploymentContractFinder $finder
    ): Response {
        $employmentContract = $finder->__invoke($request->get('id'));

        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'page_title'            => TwigTemplateConstants::SECTION_TITLE,
            'list_path'             => TwigTemplateConstants::LIST_PATH,
            'id'                    => $employmentContract->id(),
            'name'                  => $flashSession->get('inputs.name') ?? $employmentContract->name(),
            'name_available_path'   => TwigTemplateConstants::FULLNAME_AVAILABLE_PATH,
            'form_action_attribute' => TwigTemplateConstants::UPDATE_PATH,
            'submit_button_label'   => FormConstant::SUBMIT_BUTTON_VALUE_TO_UPDATE,
            'action_to_do'          => FormConstant::UPDATE_LABEL_TEXT,
        ]);
    }
}
