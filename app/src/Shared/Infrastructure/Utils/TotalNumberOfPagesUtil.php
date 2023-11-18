<?php

namespace App\Shared\Infrastructure\Utils;

use InvalidArgumentException;

final class TotalNumberOfPagesUtil
{

    public static function calculate(int $page, int $limit, int $numberOfItems): int
    {
        self::ensureIsGreaterThanZero($page, 'page');

        self::ensureIsGreaterThanZero($limit, 'limit');

        $totalPages = ceil($numberOfItems / $limit);

        /* it happen when apply filter and not result found */
        if ($totalPages < 1) {
            return 1;
        }

        if ($page > $totalPages) {
            throw new InvalidArgumentException('Page not found');
        }

        return $totalPages;
    }

    private static function ensureIsGreaterThanZero(int $value, string $paramName): void
    {
        if ($value < 1) {
            throw new InvalidArgumentException('Page not found');
        }
    }
}
