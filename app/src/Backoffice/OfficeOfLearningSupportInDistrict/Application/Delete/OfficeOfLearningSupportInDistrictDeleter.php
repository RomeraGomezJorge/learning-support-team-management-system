<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Delete;

use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single\OfficeOfLearningSupportInDistrictFinder;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\Exception\CannotDeleteDistrictWithRelatedOffices;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;

final class OfficeOfLearningSupportInDistrictDeleter
{
    private OfficeOfLearningSupportInDistrictRepository $repository;
    private OfficeOfLearningSupportInDistrictFinder $finder;

    public function __construct(
        OfficeOfLearningSupportInDistrictRepository $repository
    ) {
        $this->repository = $repository;
        $this->finder     = new OfficeOfLearningSupportInDistrictFinder($repository);
    }

    public function __invoke(string $id)
    {
        $officeOfLearningSupportInDistrict = $this->finder->__invoke($id);

        if ($officeOfLearningSupportInDistrict->hasOfficesOfLearningSupport()) {
            throw new CannotDeleteDistrictWithRelatedOffices();
        }

        $this->repository->delete($officeOfLearningSupportInDistrict);
    }
}
