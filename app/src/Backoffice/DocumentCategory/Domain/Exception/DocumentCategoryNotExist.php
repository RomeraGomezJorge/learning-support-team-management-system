<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Domain\Exception;

use App\Shared\Domain\DomainError;

final class DocumentCategoryNotExist extends DomainError
{
    private string $id;

    public function __construct(string $id)
    {
        $this->id = $id;

        parent::__construct();
    }

    public function errorCode(): string
    {
        return 'document_category_not_exist';
    }

    protected function errorMessage(): string
    {
        return sprintf('The document category <%s> does not exist', $this->id);
    }
}
