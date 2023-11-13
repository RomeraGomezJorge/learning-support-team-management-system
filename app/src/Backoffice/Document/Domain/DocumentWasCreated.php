<?php

declare(strict_types=1);

namespace App\Backoffice\Document\Domain;

use App\Shared\Domain\Bus\Event\DomainEvent;

final class DocumentWasCreated extends DomainEvent
{
    private ?string $name;
    private ?string $number;
    private string $documentCategory;

    private function __construct(
        string $id,
        ?string $name,
        ?string $number,
        string $documentCategory,
        string $eventId = null,
        string $occurredOn = null
    ) {
        parent::__construct($id, $eventId, $occurredOn);
        $this->name             = $name;
        $this->number           = $number;
        $this->documentCategory = $documentCategory;
    }

    public static function with(
        string $id,
        string $name,
        string $number,
        string $documentCategory
    ): self {
        return new self($id, $name, $number, $documentCategory);
    }

    public static function eventName(): string
    {
        return 'document.was.created';
    }

    public function name(): string
    {
        return $this->name;
    }

    public function number(): string
    {
        return $this->number;
    }

    public function documentCategory(): string
    {
        return $this->documentCategory;
    }
}
