<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Put;

use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single\OfficeOfLearningSupportInDistrictFinder;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictNameIsAvailableSpecification;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\ValueObject\OfficeOfLearningSupportInDistrictName;

final class OfficeOfLearningSupportInDistrictChangerDetails
{
    private OfficeOfLearningSupportInDistrictRepository $repository;
    private OfficeOfLearningSupportInDistrictFinder $finder;
    private OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $nameIsAvailableSpecification;

    public function __construct(
        OfficeOfLearningSupportInDistrictRepository $repository,
        OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $nameIsAvailableSpecification
    ) {
        $this->repository                   = $repository;
        $this->finder                       = new OfficeOfLearningSupportInDistrictFinder($repository);
        $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
    }

    public function __invoke(string $id, string $newName): void
    {
        $officeOfLearningSupportInDistrict = $this->finder->__invoke($id);

        $officeOfLearningSupportInDistrict->changeDetails(
            new OfficeOfLearningSupportInDistrictName($newName),
            $this->nameIsAvailableSpecification
        );

        $this->repository->save($officeOfLearningSupportInDistrict);
    }
}
