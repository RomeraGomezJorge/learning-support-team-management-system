<?php

  declare(strict_types=1);

  namespace App\Backoffice\Document\Infrastructure\UserInterface\Web;

  use App\Backoffice\Document\Application\Get\Single\DocumentFinder;
  use App\Backoffice\Document\Domain\Document;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentType;
  use App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web\TwigTemplateConstants as CategoryTwigTemplateConstants;
  use App\Shared\Infrastructure\Constant\FormConstant;
  use App\Shared\Infrastructure\RelatedEntities;
  use App\Shared\Infrastructure\Storage\AttachmentInSession;
  use App\Shared\Infrastructure\Symfony\FlashSession;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\HttpFoundation\Response;

  class DocumentEditController extends WebController
{
    public function __invoke(
        FlashSession $flashSession,
        Request $request,
        DocumentFinder $finder,
        RelatedEntities $relatedEntities,
        AttachmentInSession $attachmentInSession
    ): Response {
        $document = $finder->__invoke($request->get('id'));

        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'page_title'                                => TwigTemplateConstants::SECTION_TITLE,
            'list_path'                                 => TwigTemplateConstants::LIST_PATH,
            'id'                                        => $document->id(),
            'name'                                      => $flashSession->get('inputs.name') ?? $document->name(),
            'number'                                    => $flashSession->get('inputs.number') ?? $document->number(),
            'document_category_id'                      => $flashSession->get('inputs.document_category_id') ?? $document->documentCategory()
                    ->id(),
            'employees'                                 => $this->getEmployeesIds($document),
            'categories'                                => $relatedEntities->documentCategoriesSortedAlphabetically(),
            'employment_contracts'                      => $relatedEntities->employmentContractsSortedAlphabetically(),
            'attachment_in_session'                     => $attachmentInSession->__invoke(),
            'attachments'                               => $document->attachment(),
            'attachment_file_directory'                 => $this->getParameter('document_attachment_directory'),
            'attachment_delete_path'                    => TwigTemplateConstants::ATTACHMENT_DELETE_PATH,
            'attachment_delete_modal_confirmation_path' => TwigTemplateConstants::ATTACHMENT_DELETE_MODAL_CONFIRMATION_PATH,
            'attachment_type_descriptions'              => [
                AttachmentType::IMAGE    => 'Imagen',
                AttachmentType::DOCUMENT => 'Documento',
            ],
            'allowed_files'                             => TwigTemplateConstants::ALLOWED_FILES,
            'add_document_category_by_modal_path'       => CategoryTwigTemplateConstants::ADD_DOCUMENT_CATEGORY_BY_MODAL_PATH,
            'form_action_attribute'                     => TwigTemplateConstants::UPDATE_PATH,
            'submit_button_label'                       => FormConstant::SUBMIT_BUTTON_VALUE_TO_UPDATE,
            'action_to_do'                              => FormConstant::UPDATE_LABEL_TEXT,
        ]);
    }


    private function getEmployeesIds(Document $document): array
    {
        return array_map(function ($employee) {
            return $employee->id();
        }, $document->employees()->toArray());
    }
}
