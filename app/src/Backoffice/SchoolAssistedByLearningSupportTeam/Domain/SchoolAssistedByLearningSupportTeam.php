<?php

declare(strict_types=1);

namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain;

use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamName;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamNumber;
use App\Shared\Domain\Aggregate\AggregateRoot;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class SchoolAssistedByLearningSupportTeam extends AggregateRoot
{
    private string $id;
    private ?string $name;
    private ?string $number;
    private Datetime $createAt;
    private $learningSupportTeams;

    public function __construct()
    {
        $this->learningSupportTeams = new ArrayCollection();
    }

    public static function create(
        Uuid $id,
        ?SchoolAssistedByLearningSupportTeamName $name,
        ?SchoolAssistedByLearningSupportTeamNumber $number,
        DateTime $createAt
    ): self {
        $schoolsAssistedByLearningSupportTeam           = new self();
        $schoolsAssistedByLearningSupportTeam->id       = $id->value();
        $schoolsAssistedByLearningSupportTeam->name     = $name->value();
        $schoolsAssistedByLearningSupportTeam->number   = $number->value();
        $schoolsAssistedByLearningSupportTeam->createAt = $createAt;

        $schoolsAssistedByLearningSupportTeam->recordThat(SchoolAssistedByLearningSupportTeamWasCreated::with(
            $id->value(),
            $name->value(),
            $number->value()
        ));

        return $schoolsAssistedByLearningSupportTeam;
    }

    public function changeDetails(
        SchoolAssistedByLearningSupportTeamName $aNewName,
        SchoolAssistedByLearningSupportTeamNumber $aNewNumber
    ): self {
        $this->name   = $aNewName->value();
        $this->number = $aNewNumber->value();
        return $this;
    }

    public function id(): string
    {
        return $this->id;
    }

    public function name(): ?string
    {
        return $this->name;
    }

    public function number(): ?string
    {
        return $this->number;
    }

    public function createAt(): DateTime
    {
        return $this->createAt;
    }

    /**
     * @return ArrayCollection|LearningSupportTeam[]
     */
    public function learningSupportTeams(): Collection
    {
        return $this->learningSupportTeams;
    }

    public function addLearningSupportTeam(LearningSupportTeam $learningSupportTeam)
    {
        if (!$this->learningSupportTeams->contains($learningSupportTeam)) {
            $this->learningSupportTeams[] = $learningSupportTeam;
        }
        return $this;
    }

    public function removeLearningSupportTeam(
        LearningSupportTeam $learningSupportTeam
    ): self {
        if ($this->learningSupportTeams->contains($learningSupportTeam)) {
            $this->learningSupportTeams->removeElement($learningSupportTeam);
        }

        return $this;
    }
}
