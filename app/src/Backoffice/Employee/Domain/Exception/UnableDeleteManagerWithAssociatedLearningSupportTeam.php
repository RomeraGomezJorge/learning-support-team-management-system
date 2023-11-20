<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Domain\Exception;

use App\Shared\Domain\DomainError;

final class UnableDeleteManagerWithAssociatedLearningSupportTeam extends DomainError
{
    public function errorCode(): string
    {
        return 'cannot_delete_manager_has_learning_support_team_related';
    }

    protected function errorMessage(): string
    {
        return 'The employee serves as the manager of a learning support team, and therefore, their profile cannot be removed.';
    }
}
