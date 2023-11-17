<?php

  declare(strict_types=1);

  namespace App\Backoffice\Document\Application\Delete;

  use App\Backoffice\Document\Application\Get\Single\DocumentFinder;
  use App\Backoffice\Document\Domain\DocumentRepository;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\Attachment;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentDescription;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentType;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentUrl;
  use App\Shared\Domain\AttachmentHandler;

final class AttachmentDeleter
{
    const RETURN_ASSOCIATIVE_ARRAY = true;
    private DocumentRepository $repository;
    private DocumentFinder $finder;
    private AttachmentHandler $attachmentHandler;

    public function __construct(DocumentRepository $repository, AttachmentHandler $attachmentHandler)
    {
        $this->repository        = $repository;
        $this->finder            = new DocumentFinder($repository);
        $this->attachmentHandler = $attachmentHandler;
    }

    public function __invoke(string $id, string $attachment)
    {
        $document = $this->finder->__invoke($id);

        $attachment = json_decode($attachment, self::RETURN_ASSOCIATIVE_ARRAY);

        $attachmentToRemove = Attachment::create(
            new AttachmentUrl($attachment['url']),
            new AttachmentType($attachment['type']),
            new AttachmentDescription($attachment['description'])
        );

        $document->removeAttachment($attachmentToRemove);

        $this->repository->save($document);

        $attachmentDirectory = 'document_attachment_directory';

        $this->attachmentHandler->delete($attachmentDirectory, $attachmentToRemove->url());
    }
}
