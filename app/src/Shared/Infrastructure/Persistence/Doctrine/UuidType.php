<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Persistence\Doctrine;

use App\Shared\Domain\Utils;
use App\Shared\Domain\ValueObject\Uuid;
use Doctrine\DBAL\Platforms\AbstractPlatform;
use Doctrine\DBAL\Types\StringType;
use function Lambdish\Phunctional\last;

abstract class UuidType extends StringType
{
    public function getName(): string
    {
        return self::customTypeName();
    }

    public static function customTypeName(): string
    {
        return Utils::toSnakeCase(str_replace('Type', '', last(explode('\\', static::class))));
    }

    public function convertToPHPValue($value, AbstractPlatform $platform)
    {
        $className = $this->typeClassName();

        return new $className($value);
    }

    abstract protected function typeClassName(): string;

    /** @var Uuid $value */
    public function convertToDatabaseValue($value, AbstractPlatform $platform)
    {
        return $value->value();
    }
}
