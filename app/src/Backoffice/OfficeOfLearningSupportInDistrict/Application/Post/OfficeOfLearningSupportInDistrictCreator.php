<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Post;

use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrict;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictNameIsAvailableSpecification;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\ValueObject\OfficeOfLearningSupportInDistrictName;
use App\Shared\Domain\Bus\Event\EventBus;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

final class OfficeOfLearningSupportInDistrictCreator
{
    private OfficeOfLearningSupportInDistrictRepository $repository;
    private OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $nameIsAvailableSpecification;
    private EventBus $bus;

    public function __construct(
        OfficeOfLearningSupportInDistrictRepository $repository,
        OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $nameIsAvailableSpecification,
        EventBus $bus
    ) {
        $this->repository                   = $repository;
        $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
        $this->bus                          = $bus;
    }

    public function __invoke(string $id, string $name)
    {
        $id = new Uuid($id);

        $createAt = new DateTime();

        $officeOfLearningSupportInDistrict = OfficeOfLearningSupportInDistrict::create(
            $id,
            new OfficeOfLearningSupportInDistrictName($name),
            $createAt,
            $this->nameIsAvailableSpecification
        );

        $this->repository->save($officeOfLearningSupportInDistrict);

        $this->bus->publish(...$officeOfLearningSupportInDistrict->pullDomainEvents());
    }
}
