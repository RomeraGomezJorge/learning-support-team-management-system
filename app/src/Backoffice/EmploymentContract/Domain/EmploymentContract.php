<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Domain;

use App\Backoffice\EmploymentContract\Domain\Exception\UnavailableEmploymentContractName;
use App\Backoffice\EmploymentContract\Domain\ValueObject\EmploymentContractName;
use App\Shared\Domain\Aggregate\AggregateRoot;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class EmploymentContract extends AggregateRoot
{
    private string $id;
    private string $name;
    private Datetime $createAt;
    private $employees;

    public function __construct()
    {
        $this->employees = new ArrayCollection();
    }

    public static function create(
        Uuid $id,
        EmploymentContractName $name,
        DateTime $createAt,
        EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification
    ): self {
        $employmentContract           = new self();
        $employmentContract->id       = $id->value();
        $employmentContract->name     = $name->value();
        $employmentContract->createAt = $createAt;
        $employmentContract->recordThat(EmploymentContractWasCreated::with($id->value(), $name->value()));

        if (!$employmentContractNameIsAvailableSpecification->isSatisfiedBy($employmentContract)) {
            throw new UnavailableEmploymentContractName($name);
        }
        return $employmentContract;
    }

    public function changeDetails(
        EmploymentContractName $aNewName,
        EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification
    ): self {
        $this->changeName($aNewName, $employmentContractNameIsAvailableSpecification);
        return $this;
    }

    private function changeName(
        EmploymentContractName $aNewName,
        EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification
    ): void {
        if ($aNewName->isEqual($this->name)) {
            return;
        }

        $this->name = $aNewName->value();

        if (!$employmentContractNameIsAvailableSpecification->isSatisfiedBy($this)) {
            throw new UnavailableEmploymentContractName($aNewName);
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

    /**
     * @return ArrayCollection|\App\Backoffice\Document\Domain\Document[]
     */
    public function employees(): Collection
    {
        return $this->employees;
    }

    public function hasEmployees(): bool
    {
        return (bool) count($this->employees);
    }
}
