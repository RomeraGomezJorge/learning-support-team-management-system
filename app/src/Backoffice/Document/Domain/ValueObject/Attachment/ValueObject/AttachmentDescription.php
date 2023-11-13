<?php

declare(strict_types=1);

namespace App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject;

use App\Shared\Domain\ValueObject\StringValueObject;

final class AttachmentDescription extends StringValueObject
{
    public function __construct(string $value)
    {
        parent::__construct($value);
        self::minLength($this->value, 2);
        self::maxLength($this->value, 100);
    }
}
