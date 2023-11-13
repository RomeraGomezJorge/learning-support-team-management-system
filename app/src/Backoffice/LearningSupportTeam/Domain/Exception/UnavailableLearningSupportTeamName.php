<?php

declare(strict_types=1);

namespace App\Backoffice\LearningSupportTeam\Domain\Exception;

use App\Backoffice\LearningSupportTeam\Domain\ValueObject\LearningSupportTeamName;
use App\Shared\Domain\DomainError;

final class UnavailableLearningSupportTeamName extends DomainError
{
    private string $name;

    public function __construct(LearningSupportTeamName $name)
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
