<?php

  declare(strict_types=1);

  namespace App\Backoffice\Document\Application\Shared;

  use App\Backoffice\Document\Domain\Document;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\Attachment;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentDescription;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentType;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentUrl;

final class AttachFiles
{
    const URL_IS_NOT_DEFINE = '';

    public function __invoke(array $attachments, Document $document): void
    {
        if (empty($attachments)) {
            return;
        }

        foreach ($attachments as $attachment) {
            if ($attachment->url === self::URL_IS_NOT_DEFINE) {
                continue;
            }

            $document->addAttachment(
                Attachment::create(
                    new AttachmentUrl($attachment->url),
                    new AttachmentType($attachment->type),
                    new AttachmentDescription($attachment->description)
                )
            );
        }
    }
}
