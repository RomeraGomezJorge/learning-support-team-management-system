<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Document\Infrastructure\UserInterface\Web;
  
  use App\Backoffice\Document\Application\Post\DocumentCreator;
  use App\Shared\Infrastructure\Constant\MessageConstant;
  use App\Shared\Infrastructure\Storage\GetAttachmentsInRequestAndUploadFiles;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\RedirectResponse;
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\HttpFoundation\Response;
  
  class DocumentPostController extends WebController {
    
    public function __invoke(
        Request                               $request,
        DocumentCreator                       $creator,
        ValidationRulesToCreateAndUpdate      $validationRules,
        GetAttachmentsInRequestAndUploadFiles $getAttachmentsInRequestAndUploadFiles
    ): Response
    {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->redirectOnInvalidCsrfToken();
        }

        $validationErrors = $validationRules->verify($request);

        return $validationErrors->count() !== 0
            ? $this->redirectWithErrors(TwigTemplateConstants::CREATE_PATH, $validationErrors, $request)
            : $this->create($request, $creator, $getAttachmentsInRequestAndUploadFiles);
    }

      private function create(
          Request                               $request,
          DocumentCreator                       $creator,
          GetAttachmentsInRequestAndUploadFiles $getAttachmentsInRequestAndUploadFiles
      ): RedirectResponse
      {

          $prefixForFilename = $request->get('name') . ' ' . $request->get('number');

          $attachmentDirectory = 'document_attachment_directory';

          $creator->__invoke(
              $request->get('id'),
              $request->get('name'),
              $request->get('number'),
              $request->get('document_category_id'),
        $request->get('employees'),
        $getAttachmentsInRequestAndUploadFiles->__invoke(
          $request,
          $prefixForFilename,
          $attachmentDirectory)
      );
      
      return $this->redirectWithMessage(
        TwigTemplateConstants::LIST_PATH,
        MessageConstant::SUCCESS_MESSAGE_TO_CREATE
      );
    }
    
  }
