<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Application\Post;

use App\Backoffice\JobDesignation\Domain\JobDesignation;
use App\Backoffice\JobDesignation\Domain\JobDesignationNameIsAvailableSpecification;
use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
use App\Backoffice\JobDesignation\Domain\ValueObject\JobDesignationName;
use App\Shared\Domain\Bus\Event\EventBus;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

final class JobDesignationCreator
{
    private JobDesignationRepository $repository;
    private JobDesignationNameIsAvailableSpecification $nameIsAvailableSpecification;
    private EventBus $bus;

    public function __construct(
        JobDesignationRepository $repository,
        JobDesignationNameIsAvailableSpecification $nameIsAvailableSpecification,
        EventBus $bus
    ) {
        $this->repository                   = $repository;
        $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
        $this->bus                          = $bus;
    }

    public function __invoke(string $id, string $name)
    {
        $id = new Uuid($id);

        $createAt = new DateTime();

        $jobDesignation = JobDesignation::create(
            $id,
            new JobDesignationName($name),
            $createAt,
            $this->nameIsAvailableSpecification
        );

        $this->repository->save($jobDesignation);

        $this->bus->publish(...$jobDesignation->pullDomainEvents());
    }
}
