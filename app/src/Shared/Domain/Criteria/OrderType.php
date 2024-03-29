<?php

declare(strict_types=1);

namespace App\Shared\Domain\Criteria;

use App\Shared\Domain\ValueObject\Enum;
use InvalidArgumentException;

/**
 * @method static OrderType asc()
 * @method static OrderType desc()
 */
final class OrderType extends Enum
{
    public const ASC = 'asc';
    public const DESC = 'desc';
    public const NONE = '';

    public function isNone(): bool
    {
        return $this->equals(self::none());
    }

    protected function throwExceptionForInvalidValue($value): void
    {
        throw new InvalidArgumentException($value);
    }
}
