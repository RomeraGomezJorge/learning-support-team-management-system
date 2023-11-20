<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Domain\Exception;

use App\Shared\Domain\DomainError;

final class UnableDeleteJobDesignationWithAssociatedEmployees extends DomainError
{
    public function errorCode(): string
    {
        return 'cannot_delete_job_designation_has_emplooyes_related';
    }

    protected function errorMessage(): string
    {
        return 'The job designation as related employees, so it cannot be deleted.';
    }
}
