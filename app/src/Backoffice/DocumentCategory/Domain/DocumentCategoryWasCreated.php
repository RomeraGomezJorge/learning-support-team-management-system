<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Domain;

use App\Shared\Domain\Bus\Event\DomainEvent;

final class DocumentCategoryWasCreated extends DomainEvent
{
    private string $name;

    private function __construct(
        string $id,
        string $username,
        string $eventId = null,
        string $occurredOn = null
    ) {
        parent::__construct($id, $eventId, $occurredOn);
        $this->name = $username;
    }

    public static function with(string $id, string $name): self
    {
        return new self($id, $name);
    }

    public static function eventName(): string
    {
        return 'jobDesignation.was.created';
    }

    public function name(): string
    {
        return $this->name;
    }
}
