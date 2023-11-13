<?php

declare(strict_types=1);

namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Post;

use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeam;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamName;
use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamNumber;
use App\Shared\Domain\Bus\Event\EventBus;
use App\Shared\Domain\ValueObject\Uuid;
use DateTime;

final class SchoolAssistedByLearningSupportTeamCreator
{
    private SchoolAssistedByLearningSupportTeamRepository $repository;
    private EventBus $bus;

    public function __construct(
        SchoolAssistedByLearningSupportTeamRepository $repository,
        EventBus $bus
    ) {
        $this->repository = $repository;
        $this->bus        = $bus;
    }

    public function __invoke(string $id, string $name, string $number)
    {
        $id = new Uuid($id);

        $createAt = new DateTime();

        $schoolsAssistedByLearningSupportTeam = SchoolAssistedByLearningSupportTeam::create(
            $id,
            new SchoolAssistedByLearningSupportTeamName($name),
            new SchoolAssistedByLearningSupportTeamNumber($number),
            $createAt
        );

        $this->repository->save($schoolsAssistedByLearningSupportTeam);

        $this->bus->publish(...$schoolsAssistedByLearningSupportTeam->pullDomainEvents());
    }
}
