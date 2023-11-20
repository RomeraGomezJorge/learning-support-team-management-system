<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\Exception;

use App\Shared\Domain\DomainError;

final class UnableDeleteDistrictWithAssociatedOffices extends DomainError
{
    public function errorCode(): string
    {
        return 'cannot_delete_district_has_offices_related';
    }

    protected function errorMessage(): string
    {
        return 'The district as related offices of learning support, so it cannot be deleted.';
    }
}
