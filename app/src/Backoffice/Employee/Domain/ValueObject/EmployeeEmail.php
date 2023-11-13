<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Domain\ValueObject;

use App\Shared\Domain\ValueObject\StringValueObject;

final class EmployeeEmail extends StringValueObject
{
    public function __construct(?string $value)
    {
        parent::__construct($value);

        if (parent::isNotEmpty()) {
            parent::email($this->value());
        }
    }
}
