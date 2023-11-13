<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Domain\Exception;

use App\Backoffice\DocumentCategory\Domain\ValueObject\DocumentCategoryName;
use App\Shared\Domain\DomainError;

final class UnavailableDocumentCategoryName extends DomainError
{
    private string $name;

    public function __construct(DocumentCategoryName $name)
    {
        $this->name = $name->value();

        parent::__construct();
    }

    public function errorCode(): string
    {
        return 'name_already_exists';
    }

    protected function errorMessage(): string
    {
        return sprintf('the  "%s" value is already used.', $this->name);
    }
}
