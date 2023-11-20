<?php

  declare(strict_types=1);

  namespace App\Backoffice\Employee\Domain;

  use App\Backoffice\Document\Domain\Document;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeAddress;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeEmail;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeIdentityCard;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeName;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeePhone;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeSurname;
  use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
  use App\Backoffice\JobDesignation\Domain\JobDesignation;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
  use App\Shared\Domain\Aggregate\AggregateRoot;
  use App\Shared\Domain\ValueObject\Uuid;
  use DateTime;
  use Doctrine\Common\Collections\ArrayCollection;
  use Doctrine\Common\Collections\Collection;

class Employee extends AggregateRoot
{
    private string $id;
    private string $name;
    private string $surname;
    private ?string $identityCard;
    private ?string $phone;
    private ?string $email;
    private ?Datetime $hireDate;
    private ?Datetime $terminationDate;
    private ?string $address;
    private JobDesignation $jobDesignation;
    private EmploymentContract $employmentContract;
    private string $shiftWork;
    private ?Datetime $birthday;
    private Datetime $createAt;
    private Datetime $updateAt;
    private $learningSupportTeams;
    private $documents;
    private $learningSupportTeamsToManage;

    public function __construct()
    {
        $this->learningSupportTeams         = new ArrayCollection();
        $this->learningSupportTeamsToManage = new ArrayCollection();
        $this->documents                    = new ArrayCollection();
    }

    public static function create(
        Uuid $id,
        EmployeeName $name,
        EmployeeSurname $surname,
        ?EmployeeIdentityCard $identityCard,
        ?EmployeePhone $phone,
        ?EmployeeEmail $email,
        ?DateTime $hireDate,
        ?DateTime $terminationDate,
        ?EmployeeAddress $address,
        JobDesignation $jobDesignation,
        EmploymentContract $employmentContract,
        EmployeeShitWork $shitWork,
        ?DateTime $birthday,
        Datetime $createAt
    ): self {
        $employee                     = new self();
        $employee->id                 = $id->value();
        $employee->name               = $name->value();
        $employee->surname            = $surname->value();
        $employee->identityCard       = $identityCard->value();
        $employee->phone              = $phone->value();
        $employee->email              = $email->value();
        $employee->hireDate           = $hireDate;
        $employee->terminationDate    = $terminationDate;
        $employee->address            = $address->value();
        $employee->jobDesignation     = $jobDesignation;
        $employee->employmentContract = $employmentContract;
        $employee->shiftWork          = $shitWork->value();
        $employee->birthday           = $birthday;
        $employee->createAt           = $createAt;

        $employee->recordThat(EmployeeWasCreated::with(
            $id->value(),
            $name->value(),
            $surname->value(),
            ($identityCard->value()) ? $identityCard->value() : '',
            ($phone->value()) ? $phone->value() : '',
            ($email->value()) ? $email->value() : '',
            ($hireDate) ? $hireDate->format('Y-m-d H:i:s') : '',
            ($terminationDate) ? $terminationDate->format('Y-m-d H:i:s') : '',
            ($address->value()) ? $address->value() : '',
            $jobDesignation->id(),
            $employmentContract->id(),
            $shitWork->value(),
            ($birthday) ? $birthday->format('Y-m-d H:i:s') : ''
        ));

        return $employee;
    }

    public function changeDetails(
        EmployeeName $name,
        EmployeeSurname $surname,
        ?EmployeeIdentityCard $identityCard,
        ?EmployeePhone $phone,
        ?EmployeeEmail $email,
        ?DateTime $hireDate,
        ?DateTime $terminationDate,
        ?EmployeeAddress $address,
        JobDesignation $jobDesignation,
        EmploymentContract $employmentContract,
        EmployeeShitWork $shitWork,
        ?DateTime $birthday,
        DateTime $updateAt
    ): self {
        $this->name               = $name->value();
        $this->surname            = $surname->value();
        $this->identityCard       = $identityCard->value();
        $this->phone              = $phone->value();
        $this->email              = $email->value();
        $this->hireDate           = $hireDate;
        $this->terminationDate    = $terminationDate;
        $this->address            = $address->value();
        $this->jobDesignation     = $jobDesignation;
        $this->employmentContract = $employmentContract;
        $this->shiftWork          = $shitWork->value();
        $this->birthday           = $birthday;
        $this->updateAt           = $updateAt;
        return $this;
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

    public function surname(): string
    {
        return $this->surname;
    }

    public function identityCard(): ?string
    {
        return $this->identityCard;
    }

    public function phone(): ?string
    {
        return $this->phone;
    }

    public function email(): ?string
    {
        return $this->email;
    }

    public function hireDate(): ?DateTime
    {
        return $this->hireDate;
    }

    public function terminationDate(): ?DateTime
    {
        return $this->terminationDate;
    }

    public function address(): ?string
    {
        return $this->address;
    }

    public function jobDesignation(): JobDesignation
    {
        return $this->jobDesignation;
    }

    public function employmentContract(): EmploymentContract
    {
        return $this->employmentContract;
    }

    public function shiftWork(): string
    {
        return $this->shiftWork;
    }

    public function birthday(): ?DateTime
    {
        return $this->birthday;
    }

    /**
     * @return ArrayCollection|LearningSupportTeam[]
     */
    public function learningSupportTeams(): Collection
    {
        return $this->learningSupportTeams;
    }

    public function addLearningSupportTeam(LearningSupportTeam $LearningSupportTeam)
    {
        if (!$this->learningSupportTeams->contains($LearningSupportTeam)) {
            $this->learningSupportTeams[] = $LearningSupportTeam;
        }
        return $this;
    }

    public function removeLearningSupportTeam(LearningSupportTeam $LearningSupportTeam): self
    {
        if ($this->learningSupportTeams->contains($LearningSupportTeam)) {
            $this->learningSupportTeams->removeElement($LearningSupportTeam);
        }

        return $this;
    }

    /**
     * @return ArrayCollection|Document[]
     */
    public function documents(): ?Collection
    {
        return $this->documents;
    }

    public function addDocument(Document $document)
    {
        if (!$this->documents->contains($document)) {
            $this->documents[] = $document;
        }
        return $this;
    }

    public function removeDocument(Document $document): self
    {
        if ($this->documents->contains($document)) {
            $this->documents->removeElement($document);
        }

        return $this;
    }

    /**
     * @return ArrayCollection|\App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam[]
     */
    public function learningSupportTeamToManage(): Collection
    {
        return $this->learningSupportTeamsToManage;
    }

    public function servesAsManager(): bool
    {
        return (bool)count($this->learningSupportTeamsToManage);
    }
}
