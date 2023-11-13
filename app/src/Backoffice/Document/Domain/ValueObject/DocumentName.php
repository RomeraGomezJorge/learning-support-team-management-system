<?php

declare(strict_types=1);

namespace App\Backoffice\Document\Domain\ValueObject;

use App\Shared\Domain\ValueObject\StringValueObject;

final class DocumentName extends StringValueObject
{
    public function __construct(string $value)
    {
        parent::__construct($value);
        parent::notEmpty($this->value);
        parent::maxLength($this->value, 255);
    }
}
