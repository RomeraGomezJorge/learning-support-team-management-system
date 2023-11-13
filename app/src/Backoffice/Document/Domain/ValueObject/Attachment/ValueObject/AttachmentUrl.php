<?php

declare(strict_types=1);

namespace App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject;

use App\Shared\Domain\ValueObject\StringValueObject;

final class AttachmentUrl extends StringValueObject
{
    public function __construct(string $value)
    {
        parent::__construct($value);
        self::notEmpty($this->value);
        self::maxLength($this->value, 255);
    }
}
