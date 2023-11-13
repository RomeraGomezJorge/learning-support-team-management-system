<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Application\Put;

use App\Backoffice\OfficeOfLearningSupport\Application\Get\Single\OfficeOfLearningSupportFinder;
use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
use App\Backoffice\OfficeOfLearningSupport\Domain\ValueObject\OfficeOfLearningSupportAddress;
use App\Backoffice\OfficeOfLearningSupport\Domain\ValueObject\OfficeOfLearningSupportPhone;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single\OfficeOfLearningSupportInDistrictFinder;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;

final class OfficeOfLearningSupportChangerDetails
{
    private OfficeOfLearningSupportRepository $repository;
    private OfficeOfLearningSupportFinder $finder;
    private OfficeOfLearningSupportInDistrictFinder $officeOfLearningSupportInDistrictFinder;

    public function __construct(
        OfficeOfLearningSupportRepository $repository,
        OfficeOfLearningSupportInDistrictRepository $officeOfLearningSupportInDistrictRepository
    ) {
        $this->repository                              = $repository;
        $this->finder                                  = new OfficeOfLearningSupportFinder($repository);
        $this->officeOfLearningSupportInDistrictFinder = new OfficeOfLearningSupportInDistrictFinder($officeOfLearningSupportInDistrictRepository);
    }

    public function __invoke(
        string $id,
        string $newAddress,
        ?string $newPhone,
        string $officeOfLearningSupportInDistrictId
    ): void {
        $officeOfLearningSupport = $this->finder->__invoke($id);

        $officeOfLearningSupportInDistrict = $this->officeOfLearningSupportInDistrictFinder->__invoke($officeOfLearningSupportInDistrictId);

        $officeOfLearningSupport->changeDetails(
            new OfficeOfLearningSupportAddress($newAddress),
            new OfficeOfLearningSupportPhone($newPhone),
            $officeOfLearningSupportInDistrict,
        );

        $this->repository->save($officeOfLearningSupport);
    }
}
