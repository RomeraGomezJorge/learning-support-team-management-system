<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Application\Post;

use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupport;
use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
use App\Backoffice\OfficeOfLearningSupport\Domain\ValueObject\OfficeOfLearningSupportAddress;
use App\Backoffice\OfficeOfLearningSupport\Domain\ValueObject\OfficeOfLearningSupportPhone;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single\OfficeOfLearningSupportInDistrictFinder;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;
use App\Shared\Domain\Bus\Event\EventBus;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

final class OfficeOfLearningSupportCreator
{
    private OfficeOfLearningSupportRepository $repository;
    private OfficeOfLearningSupportInDistrictFinder $officeOfLearningSupportInDistrictFinder;
    private EventBus $bus;

    public function __construct(
        OfficeOfLearningSupportRepository $repository,
        OfficeOfLearningSupportInDistrictRepository $officeOfLearningSupportInDistrictRepository,
        EventBus $bus
    ) {
        $this->repository                              = $repository;
        $this->officeOfLearningSupportInDistrictFinder = new OfficeOfLearningSupportInDistrictFinder($officeOfLearningSupportInDistrictRepository);
        $this->bus                                     = $bus;
    }

    public function __invoke(
        string $id,
        ?string $address,
        ?string $phone,
        string $officeOfLearningSupportInDistrictId
    ) {
        $id = new Uuid($id);

        $createAt = new DateTime();

        $officeOfLearningSupportInDistrict = $this->officeOfLearningSupportInDistrictFinder->__invoke($officeOfLearningSupportInDistrictId);

        $officeOfLearningSupport = OfficeOfLearningSupport::create(
            $id,
            new OfficeOfLearningSupportAddress($address),
            new OfficeOfLearningSupportPhone($phone),
            $officeOfLearningSupportInDistrict,
            $createAt
        );

        $this->repository->save($officeOfLearningSupport);

        $this->bus->publish(...$officeOfLearningSupport->pullDomainEvents());
    }
}
