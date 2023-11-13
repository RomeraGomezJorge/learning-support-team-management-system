<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain;

use App\Shared\Domain\Bus\Event\DomainEvent;

final class OfficeOfLearningSupportInDistrictWasCreated extends DomainEvent
{
    private string $name;

    private function __construct(
        string $id,
        string $name,
        string $eventId = null,
        string $occurredOn = null
    ) {
        parent::__construct($id, $eventId, $occurredOn);
        $this->name = $name;
    }

    public static function with(string $id, string $name): self
    {
        return new self($id, $name);
    }

    public static function eventName(): string
    {
        return 'officeOfLearningSupportInDistrict.was.created';
    }

    public function name(): string
    {
        return $this->name;
    }
}
