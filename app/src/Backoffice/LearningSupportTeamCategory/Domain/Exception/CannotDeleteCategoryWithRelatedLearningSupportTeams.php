<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeamCategory\Domain\Exception;

use App\Shared\Domain\DomainError;

final class CannotDeleteCategoryWithRelatedLearningSupportTeams extends DomainError
{
    public function errorCode(): string
    {
        return 'cannot_delete_category_has_learning_support_teams_related';
    }

    protected function errorMessage(): string
    {
        return sprintf('The category as related learning support teams, so it cannot be deleted.');
    }
}
