<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Domain\Exception;

use App\Shared\Domain\DomainError;

final class UnableDeleteEmploymentContractWithAssociatedEmployees extends DomainError
{
    public function errorCode(): string
    {
        return 'cannot_delete_employment_contract_has_employees_related';
    }

    protected function errorMessage(): string
    {
        return 'The employment contract as related employees, so it cannot be deleted.';
    }
}
