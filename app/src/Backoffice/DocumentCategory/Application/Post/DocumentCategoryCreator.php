<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Application\Post;

use App\Backoffice\DocumentCategory\Domain\DocumentCategory;
use App\Backoffice\DocumentCategory\Domain\DocumentCategoryNameIsAvailableSpecification;
use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;
use App\Backoffice\DocumentCategory\Domain\ValueObject\DocumentCategoryName;
use App\Shared\Domain\Bus\Event\EventBus;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

final class DocumentCategoryCreator
{
    private DocumentCategoryRepository $repository;
    private DocumentCategoryNameIsAvailableSpecification $nameIsAvailableSpecification;
    private EventBus $bus;

    public function __construct(
        DocumentCategoryRepository $repository,
        DocumentCategoryNameIsAvailableSpecification $nameIsAvailableSpecification,
        EventBus $bus
    ) {
        $this->repository                   = $repository;
        $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
        $this->bus                          = $bus;
    }

    public function __invoke(string $id, string $name)
    {
        $id = new Uuid($id);

        $createAt = new DateTime();

        $documentCategory = DocumentCategory::create(
            $id,
            new DocumentCategoryName($name),
            $createAt,
            $this->nameIsAvailableSpecification
        );

        $this->repository->save($documentCategory);

        $this->bus->publish(...$documentCategory->pullDomainEvents());
    }
}
