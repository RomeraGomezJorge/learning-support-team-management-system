<?php

namespace App\Shared\Infrastructure;

interface RenderFormInterface
{
    public function __invoke(): ?string;
}
