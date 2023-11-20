<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Domain;

use App\Backoffice\Employee\Domain\Employee;
use App\Backoffice\LearningSupportTeam\Domain\Exception\UnavailableLearningSupportTeamName;
use App\Backoffice\LearningSupportTeam\Domain\ValueObject\LearningSupportTeamName;
use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategory;
use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupport;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeam;
use App\Shared\Domain\Aggregate\AggregateRoot;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class LearningSupportTeam extends AggregateRoot
{
    private string $id;
    private string $name;
    private $manager;
    private Datetime $createAt;
    private $schoolsAssistedByLearningSupportTeam;
    private $officeOfLearningSupport;
    private $employees;
    private LearningSupportTeamCategory $learningSupportTeamCategory;

    public function __construct()
    {
        $this->schoolsAssistedByLearningSupportTeam = new ArrayCollection();
        $this->employees                            = new ArrayCollection();
    }

    public static function create(
        Uuid $id,
        LearningSupportTeamName $name,
        ?Employee $manager,
        OfficeOfLearningSupport $officeOfLearningSupport,
        LearningSupportTeamCategory $learningSupportTeamCategory,
        DateTime $createAt,
        LearningSupportTeamNameIsAvailableSpecification $learningSupportTeamNameIsAvailableSpecification
    ): self {
        $learningSupportTeam                              = new self();
        $learningSupportTeam->id                          = $id->value();
        $learningSupportTeam->name                        = $name->value();
        $learningSupportTeam->manager                     = $manager;
        $learningSupportTeam->officeOfLearningSupport     = $officeOfLearningSupport;
        $learningSupportTeam->learningSupportTeamCategory = $learningSupportTeamCategory;
        $learningSupportTeam->createAt                    = $createAt;
        $learningSupportTeam->recordThat(LearningSupportTeamWasCreated::with(
            $id->value(),
            $name->value(),
            $manager === null ? 'NULL' : $manager->id(),
            $officeOfLearningSupport->id(),
            $learningSupportTeamCategory->id()
        ));

        if (!$learningSupportTeamNameIsAvailableSpecification->isSatisfiedBy($learningSupportTeam)) {
            throw new UnavailableLearningSupportTeamName($name);
        }
        return $learningSupportTeam;
    }

    public function id(): string
    {
        return $this->id;
    }

    public function changeDetails(
        LearningSupportTeamName $aNewName,
        ?Employee $aNewManager,
        OfficeOfLearningSupport $aNewOfficeOfLearningSupport,
        LearningSupportTeamCategory $aNewLearningSupportTeamCategory,
        LearningSupportTeamNameIsAvailableSpecification $learningSupportTeamNameIsAvailableSpecification
    ): self {
        $this->changeName($aNewName, $learningSupportTeamNameIsAvailableSpecification);
        $this->manager                     = $aNewManager;
        $this->officeOfLearningSupport     = $aNewOfficeOfLearningSupport;
        $this->learningSupportTeamCategory = $aNewLearningSupportTeamCategory;
        return $this;
    }

    private function changeName(
        LearningSupportTeamName $aNewName,
        LearningSupportTeamNameIsAvailableSpecification $learningSupportTeamNameIsAvailableSpecification
    ): void {
        if ($aNewName->isEqual($this->name)) {
            return;
        }

        $this->name = $aNewName->value();

        if (!$learningSupportTeamNameIsAvailableSpecification->isSatisfiedBy($this)) {
            throw new UnavailableLearningSupportTeamName($aNewName);
        }
    }

    public function name(): string
    {
        return $this->name;
    }

    public function manager(): ?Employee
    {
        return $this->manager;
    }

    public function createAt(): DateTime
    {
        return $this->createAt;
    }

    public function officeOfLearningSupport(): officeOfLearningSupport
    {
        return $this->officeOfLearningSupport;
    }

    /**
     * @return ArrayCollection|SchoolAssistedByLearningSupportTeam[]
     */
    public function schoolsAssistedByLearningSupportTeam(): Collection
    {
        return $this->schoolsAssistedByLearningSupportTeam;
    }

    public function addSchoolAssistedByLearningSupportTeam(
        SchoolAssistedByLearningSupportTeam $schoolAssistedByLearningSupportTeam
    ): self {
        if (!$this->schoolsAssistedByLearningSupportTeam->contains($schoolAssistedByLearningSupportTeam)) {
            $this->schoolsAssistedByLearningSupportTeam[] = $schoolAssistedByLearningSupportTeam;
        }
        return $this;
    }

    public function removeSchoolsAssistedByLearningSupportTeam(
        SchoolAssistedByLearningSupportTeam $schoolAssistedByLearningSupportTeam
    ): self {
        if ($this->schoolsAssistedByLearningSupportTeam->contains($schoolAssistedByLearningSupportTeam)) {
            $this->schoolsAssistedByLearningSupportTeam->removeElement($schoolAssistedByLearningSupportTeam);
        }

        return $this;
    }

    /**
     * @return ArrayCollection|\App\Backoffice\Employee\Domain\Employee[]
     */
    public function employees(): Collection
    {
        return $this->employees;
    }

    public function addEmployee(?Employee $employee): self
    {
        if (!$this->employees->contains($employee)) {
            $this->employees[] = $employee;
        }
        return $this;
    }

    public function removeEmployee(?Employee $employee): self
    {
        if ($this->employees->contains($employee)) {
            $this->employees->removeElement($employee);
        }

        return $this;
    }

    public function learningSupportTeamCategory(): LearningSupportTeamCategory
    {
        return $this->learningSupportTeamCategory;
    }
}
