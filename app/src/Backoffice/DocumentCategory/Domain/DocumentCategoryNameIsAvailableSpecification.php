<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Domain;

class DocumentCategoryNameIsAvailableSpecification
{
    private DocumentCategoryRepository $repository;

    public function __construct(DocumentCategoryRepository $repository)
    {
        $this->repository = $repository;
    }

    public function isSatisfiedBy(DocumentCategory $documentCategory): bool
    {
        return $this->repository->isAvailable(array('name' => $documentCategory->name()));
    }
}
