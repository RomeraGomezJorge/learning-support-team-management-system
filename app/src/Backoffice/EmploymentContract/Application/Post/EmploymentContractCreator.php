<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Application\Post;

use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractNameIsAvailableSpecification;
use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
use App\Backoffice\EmploymentContract\Domain\ValueObject\EmploymentContractName;
use App\Shared\Domain\Bus\Event\EventBus;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

final class EmploymentContractCreator
{
    private EmploymentContractRepository $repository;
    private EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification;
    private EventBus $bus;

    public function __construct(
        EmploymentContractRepository $repository,
        EmploymentContractNameIsAvailableSpecification $employmentContractNameIsAvailableSpecification,
        EventBus $bus
    ) {
        $this->repository                                     = $repository;
        $this->employmentContractNameIsAvailableSpecification = $employmentContractNameIsAvailableSpecification;
        $this->bus                                            = $bus;
    }

    public function __invoke(string $id, string $name)
    {
        $id = new Uuid($id);

        $createAt = new DateTime();

        $employmentContract = EmploymentContract::create(
            $id,
            new EmploymentContractName($name),
            $createAt,
            $this->employmentContractNameIsAvailableSpecification
        );

        $this->repository->save($employmentContract);

        $this->bus->publish(...$employmentContract->pullDomainEvents());
    }
}
