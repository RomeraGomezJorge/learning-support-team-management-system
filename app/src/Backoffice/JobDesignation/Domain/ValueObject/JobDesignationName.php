<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Domain\ValueObject;

use App\Shared\Domain\ValueObject\StringValueObject;

final class JobDesignationName extends StringValueObject
{
    public function __construct(string $value)
    {
        parent::__construct($value);
        parent::minLength($this->value, 3);
        parent::maxLength($this->value, 100);
    }
}
