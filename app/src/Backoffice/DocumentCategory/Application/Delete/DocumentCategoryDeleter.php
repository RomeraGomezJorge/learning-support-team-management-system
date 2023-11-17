<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Application\Delete;

use App\Backoffice\DocumentCategory\Application\Get\Single\DocumentCategoryFinder;
use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;
use App\Backoffice\DocumentCategory\Domain\Exception\CannotDeleteDocumentCategoryWithRelatedDocuments;

final class DocumentCategoryDeleter
{
    private DocumentCategoryRepository $repository;
    private DocumentCategoryFinder $finder;

    public function __construct(
        DocumentCategoryRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new DocumentCategoryFinder($repository);
    }

    public function __invoke(string $id)
    {
        $documentCategory = $this->finder->__invoke($id);

        if ($documentCategory->hasDocuments()) {
            throw new CannotDeleteDocumentCategoryWithRelatedDocuments();
        }

        $this->repository->delete($documentCategory);
    }
}
