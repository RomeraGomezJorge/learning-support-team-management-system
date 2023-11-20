<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Domain\Exception;

use App\Shared\Domain\DomainError;

class UnableDeleteOfficeContractWithAssociatedTeams extends DomainError
{

    public function errorCode(): string
    {
        return 'cannot_delete_office_has_learning_support_teams_related';
    }

    protected function errorMessage(): string
    {
        return 'The office as related learning support teams, so it cannot be deleted.';
    }
}