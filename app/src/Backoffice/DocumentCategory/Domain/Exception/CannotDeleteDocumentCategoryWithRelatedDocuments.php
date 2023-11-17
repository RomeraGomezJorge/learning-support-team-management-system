<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Domain\Exception;

use App\Shared\Domain\DomainError;

final class CannotDeleteDocumentCategoryWithRelatedDocuments extends DomainError
{
    public function errorCode(): string
    {
        return 'document_category_has_documents';
    }

    protected function errorMessage(): string
    {
        return sprintf('The document category as related documents, so it cannot be deleted.');
    }
}
