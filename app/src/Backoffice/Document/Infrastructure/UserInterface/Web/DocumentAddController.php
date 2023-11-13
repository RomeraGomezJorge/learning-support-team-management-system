<?php

declare(strict_types=1);

namespace App\Backoffice\Document\Infrastructure\UserInterface\Web;

use App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web\TwigTemplateConstants as CategoryTwigTemplateConstants;
use App\Backoffice\Employee\Infrastructure\UserInterface\Web\TwigTemplateConstants as EmployeeTwigTemplateConstants;
use App\Shared\Infrastructure\Constant\FormConstant;
use App\Shared\Infrastructure\RamseyUuidGenerator;
use App\Shared\Infrastructure\RelatedEntities;
use App\Shared\Infrastructure\Storage\AttachmentInSession;
use App\Shared\Infrastructure\Symfony\FlashSession;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Response;

class DocumentAddController extends WebController
{
    public function __invoke(
        FlashSession $flashSession,
        RamseyUuidGenerator $ramseyUuidGenerator,
        RelatedEntities $relatedEntities,
        AttachmentInSession $attachmentInSession
    ): Response {
        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'list_path'                           => TwigTemplateConstants::LIST_PATH,
            'page_title'                          => TwigTemplateConstants::SECTION_TITLE,
            'id'                                  => $ramseyUuidGenerator->generate(),
            'add_document_category_by_modal_path' => CategoryTwigTemplateConstants::ADD_DOCUMENT_CATEGORY_BY_MODAL_PATH,
            'name'                                => $flashSession->get('inputs.name'),
            'number'                              => $flashSession->get('inputs.number'),
            'document_category_id'                => $flashSession->get('inputs.document_category_id'),
            'employees'                           => $flashSession->get('inputs.employees'),
            'allowed_files'                       => TwigTemplateConstants::ALLOWED_FILES,
            'attachment_in_session'               => $attachmentInSession->__invoke(),
            'categories'                          => $relatedEntities->documentCategoriesSortedAlphabetically(),
            'employment_contracts'                => $relatedEntities->employmentContractsSortedAlphabetically(),
            'add_employee_by_modal_path'          => EmployeeTwigTemplateConstants::ADD_EMPLOYEE_BY_MODAL_PATH,
            'form_action_attribute'               => TwigTemplateConstants::CREATE_PATH,
            'submit_button_label'                 => FormConstant::SUBMIT_BUTTON_VALUE_TO_CREATE,
            'action_to_do'                        => FormConstant::CREATE_LABEL_TEXT,
        ]);
    }
}
