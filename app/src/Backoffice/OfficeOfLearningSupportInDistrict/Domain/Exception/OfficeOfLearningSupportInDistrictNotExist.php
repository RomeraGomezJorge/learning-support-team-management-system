<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\Exception;

use App\Shared\Domain\DomainError;

final class OfficeOfLearningSupportInDistrictNotExist extends DomainError
{
    private string $id;

    public function __construct(string $id)
    {
        $this->id = $id;

        parent::__construct();
    }

    public function errorCode(): string
    {
        return 'office_of_learning_support_in_district_not_exist';
    }

    protected function errorMessage(): string
    {
        return sprintf('The job designation <%s> does not exist', $this->id);
    }
}
