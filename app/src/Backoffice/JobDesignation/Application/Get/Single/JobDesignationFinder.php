<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Application\Get\Single;

use App\Backoffice\JobDesignation\Domain\Exception\JobDesignationNotExist;
use App\Backoffice\JobDesignation\Domain\JobDesignation;
use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
use App\Shared\Application\Get\Collection\Finder;
use App\Shared\Domain\ValueObject\Uuid;

final class JobDesignationFinder implements Finder
{
    private const NOT_FOUND = null;
    private JobDesignationRepository $repository;

    public function __construct(JobDesignationRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke(string $id): JobDesignation
    {
        $id = new Uuid($id);

        $jobDesignation = $this->repository->search($id);

        if (self::NOT_FOUND === $jobDesignation) {
            throw new JobDesignationNotExist(($id)->value());
        }

        return $jobDesignation;
    }
}
