<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single;

use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\Exception\OfficeOfLearningSupportInDistrictNotExist;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrict;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;
use App\Shared\Domain\ValueObject\Uuid;

final class OfficeOfLearningSupportInDistrictFinder
{
    private const NOT_FOUND = null;
    private OfficeOfLearningSupportInDistrictRepository $repository;

    public function __construct(OfficeOfLearningSupportInDistrictRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke(string $id): OfficeOfLearningSupportInDistrict
    {
        $id = new Uuid($id);

        $officeOfLearningSupportInDistrict = $this->repository->search($id);

        if (self::NOT_FOUND === $officeOfLearningSupportInDistrict) {
            throw new OfficeOfLearningSupportInDistrictNotExist(($id)->value());
        }

        return $officeOfLearningSupportInDistrict;
    }
}
