<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeamCategory\Domain\Exception;

use App\Backoffice\LearningSupportTeamCategory\Domain\ValueObject\LearningSupportTeamCategoryName;
use App\Shared\Domain\DomainError;

final class UnavailableLearningSupportTeamCategoryName extends DomainError
{
    private string $name;

    public function __construct(LearningSupportTeamCategoryName $name)
    {
        $this->name = $name->value();
        parent::__construct();
    }

    public function errorCode(): string
    {
        return 'name_already_exists';
    }

    protected function errorMessage(): string
    {
        return sprintf(' "%s" value is already used.', $this->name);
    }
}
