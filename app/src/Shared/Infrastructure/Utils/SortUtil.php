<?php

namespace App\Shared\Infrastructure\Utils;

final class SortUtil
{
    public static function toggle($sort): string
    {
        return $sort === 'asc' ? 'desc' : 'asc';
    }
}
