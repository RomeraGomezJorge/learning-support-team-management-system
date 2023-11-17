<?php

  declare(strict_types=1);

  namespace App\Backoffice\LearningSupportTeam\Domain;

  use App\Shared\Domain\Bus\Event\DomainEvent;

final class LearningSupportTeamWasCreated extends DomainEvent
{
    private string $name;
    private string $manager;
    private string $officeOfLearningSupportId;
    private string $learningSupportTeamCategoryId;

    private function __construct(
        string $id,
        string $name,
        string $manager,
        string $officeOfLearningSupportId,
        string $learningSupportTeamCategoryId,
        string $eventId = null,
        string $occurredOn = null
    ) {
        parent::__construct($id, $eventId, $occurredOn);
        $this->name                          = $name;
        $this->manager                       = $manager;
        $this->officeOfLearningSupportId     = $officeOfLearningSupportId;
        $this->learningSupportTeamCategoryId = $learningSupportTeamCategoryId;
    }

    public static function with(
        string $id,
        string $name,
        string $manager,
        string $officeOfLearningSupportId,
        string $learningSupportTeamCategoryId
    ): self {
        return new self(
            $id,
            $name,
            $manager,
            $officeOfLearningSupportId,
            $learningSupportTeamCategoryId
        );
    }

    public static function eventName(): string
    {
        return 'learningSupportTeam.was.created';
    }

    public function name(): string
    {
        return $this->name;
    }

    public function manager(): string
    {
        return $this->manager;
    }

    public function officeOfLearningSupportId(): string
    {
        return $this->officeOfLearningSupportId;
    }

    public function learningSupportTeamCategoryId(): string
    {
        return $this->learningSupportTeamCategoryId;
    }
}
