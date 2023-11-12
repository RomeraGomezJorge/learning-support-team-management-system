<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Application\Post;
	
	use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategory;
	use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryNameIsAvailableSpecification;
	use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;
	use App\Backoffice\LearningSupportTeamCategory\Domain\ValueObject\LearningSupportTeamCategoryName;
	use App\Shared\Domain\Bus\Event\EventBus;
	use App\Shared\Domain\ValueObject\Uuid;
	use DateTime;
	
	
	final class LearningSupportTeamCategoryCreator
	{

		private LearningSupportTeamCategoryRepository $repository;
		private LearningSupportTeamCategoryNameIsAvailableSpecification $nameIsAvailableSpecification;
		private EventBus $bus;

        public function __construct(
            LearningSupportTeamCategoryRepository                   $repository,
            LearningSupportTeamCategoryNameIsAvailableSpecification $nameIsAvailableSpecification,
            EventBus                                                $bus
        )
        {
            $this->repository                   = $repository;
            $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
            $this->bus                          = $bus;
        }

        public function __invoke(string $id, string $name)
        {
            $id = new Uuid($id);

            $createAt = new DateTime();

            $learningSupportTeamCategory = LearningSupportTeamCategory::create(
                $id,
                new LearningSupportTeamCategoryName($name),
                $createAt,
                $this->nameIsAvailableSpecification
            );
			
			$this->repository->save($learningSupportTeamCategory);
			
			$this->bus->publish(...$learningSupportTeamCategory->pullDomainEvents());
		}
	}