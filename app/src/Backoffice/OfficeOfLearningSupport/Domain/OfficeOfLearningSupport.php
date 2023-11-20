<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Domain;

use App\Backoffice\OfficeOfLearningSupport\Domain\ValueObject\OfficeOfLearningSupportAddress;
use App\Backoffice\OfficeOfLearningSupport\Domain\ValueObject\OfficeOfLearningSupportPhone;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrict;
use App\Shared\Domain\Aggregate\AggregateRoot;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;
use Doctrine\Common\Collections\ArrayCollection;

class OfficeOfLearningSupport extends AggregateRoot
{
    private string $id;
    private ?string $address;
    private ?string $phone;
    private OfficeOfLearningSupportInDistrict $officeOfLearningSupportInDistrict;
    private Datetime $createAt;
    private $learningSupportTeams;

    public function __construct()
    {
        $this->learningSupportTeams = new ArrayCollection();
    }

    public static function create(
        Uuid $id,
        OfficeOfLearningSupportAddress $address,
        ?OfficeOfLearningSupportPhone $phone,
        OfficeOfLearningSupportInDistrict $officeOfLearningSupportInDistrict,
        DateTime $createAt
    ): self {
        $officeOfLearningSupport                                    = new self();
        $officeOfLearningSupport->id                                = $id->value();
        $officeOfLearningSupport->address                           = $address->value();
        $officeOfLearningSupport->phone                             = $phone->value();
        $officeOfLearningSupport->officeOfLearningSupportInDistrict = $officeOfLearningSupportInDistrict;
        $officeOfLearningSupport->createAt                          = $createAt;
        $officeOfLearningSupport->recordThat(OfficeOfLearningSupportWasCreated::with(
            $id->value(),
            $address->value(),
            $phone->value(),
            $officeOfLearningSupportInDistrict->id()
        ));

        return $officeOfLearningSupport;
    }

    public function id(): string
    {
        return $this->id;
    }

    public function changeDetails(
        OfficeOfLearningSupportAddress $newAddress,
        ?OfficeOfLearningSupportPhone $newPhone,
        OfficeOfLearningSupportInDistrict $newOfficeOfLearningSupportInDistrict
    ): self {
        $this->address                           = $newAddress->value();
        $this->phone                             = $newPhone->value();
        $this->officeOfLearningSupportInDistrict = $newOfficeOfLearningSupportInDistrict;

        return $this;
    }

    public function address(): ?string
    {
        return $this->address;
    }

    public function phone(): ?string
    {
        return $this->phone;
    }

    public function officeOfLearningSupportInDistrict(): OfficeOfLearningSupportInDistrict
    {
        return $this->officeOfLearningSupportInDistrict;
    }

    public function createAt(): DateTime
    {
        return $this->createAt;
    }

    public function learningSupportTeams()
    {
        return $this->learningSupportTeams;
    }

    public function hasLearningSupportTeams(): bool
    {
        return (bool)count($this->learningSupportTeams);
    }
}
