<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Domain;

use App\Backoffice\JobDesignation\Domain\Exception\UnavailableJobDesignationName;
use App\Backoffice\JobDesignation\Domain\ValueObject\JobDesignationName;
use App\Shared\Domain\Aggregate\AggregateRoot;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

class JobDesignation extends AggregateRoot
{
    private string $id;
    private string $name;
    private DateTime $createAt;


    public static function create(
        Uuid $id,
        JobDesignationName $name,
        DateTime $createAt,
        JobDesignationNameIsAvailableSpecification $jobDesignationNameIsAvailableSpecification
    ): self {
        $jobDesignation           = new self();
        $jobDesignation->id       = $id->value();
        $jobDesignation->name     = $name->value();
        $jobDesignation->createAt = $createAt;
        $jobDesignation->recordThat(JobDesignationWasCreated::with($id->value(), $name->value()));

        if (!$jobDesignationNameIsAvailableSpecification->isSatisfiedBy($jobDesignation)) {
            throw new UnavailableJobDesignationName($name);
        }
        return $jobDesignation;
    }

    public function changeDetails(
        JobDesignationName $aNewName,
        JobDesignationNameIsAvailableSpecification $jobDesignationNameIsAvailableSpecification
    ): self {
        $this->changeName($aNewName, $jobDesignationNameIsAvailableSpecification);
        return $this;
    }

    private function changeName(
        JobDesignationName $aNewName,
        JobDesignationNameIsAvailableSpecification $jobDesignationNameIsAvailableSpecification
    ): void {
        if ($aNewName->isEqual($this->name)) {
            return;
        }

        $this->name = $aNewName->value();

        if (!$jobDesignationNameIsAvailableSpecification->isSatisfiedBy($this)) {
            throw new UnavailableJobDesignationName($aNewName);
        }
    }

    public function id(): string
    {
        return $this->id;
    }

    public function name(): string
    {
        return $this->name;
    }

    public function createAt(): DateTime
    {
        return $this->createAt;
    }
}
