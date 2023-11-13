<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Application\Get\Single;

use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;

final class CheckDocumentCategoryNameAvailability
{
    private DocumentCategoryRepository $repository;

    public function __construct(DocumentCategoryRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke(string $name): bool
    {
        return $this->repository->isAvailable(['name' => $name]);
    }
}
