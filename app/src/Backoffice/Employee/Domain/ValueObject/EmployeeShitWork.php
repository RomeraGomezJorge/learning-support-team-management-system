<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Domain\ValueObject;

use App\Shared\Domain\ValueObject\StringValueObject;
use InvalidArgumentException;

final class EmployeeShitWork extends StringValueObject
{
    const UNKNOWN = '0';
    const MORNING = '1';
    const AFTERNOON = '2';
    const MORNING_AND_AFTERNOON = '3';
    const VALID_SHIFTS = [self::UNKNOWN, self::MORNING, self::AFTERNOON, self::MORNING_AND_AFTERNOON];

    public function __construct(string $value)
    {
        parent::__construct($value);
        $this->ensureIsAValidState($value);
        $this->value = $value;
    }

    private function ensureIsAValidState($value): void
    {
        if (!in_array($value, self::VALID_SHIFTS)) {
            throw new InvalidArgumentException(
                sprintf('The value <%s> is not a valid work shift to an employee.', $value)
            );
        }
    }

    public static function morning(): string
    {
        return self::MORNING;
    }

    public static function afternoon(): string
    {
        return self::AFTERNOON;
    }

    public static function morningAndAfternoon(): string
    {
        return self::MORNING_AND_AFTERNOON;
    }

    public static function unknown(): string
    {
        return self::UNKNOWN;
    }
}
