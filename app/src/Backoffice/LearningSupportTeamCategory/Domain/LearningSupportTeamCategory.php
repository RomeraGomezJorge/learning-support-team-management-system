<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Domain;
	
	use App\Backoffice\LearningSupportTeamCategory\Domain\Exception\UnavailableLearningSupportTeamCategoryName;
	use App\Backoffice\LearningSupportTeamCategory\Domain\ValueObject\LearningSupportTeamCategoryName;
	use App\Shared\Domain\Aggregate\AggregateRoot;
	use App\Shared\Domain\SlugGenerator;
	use App\Shared\Domain\ValueObject\Uuid;
	use DateTime;
	use DateTimeInterface;
	
	class LearningSupportTeamCategory extends AggregateRoot
	{
		private string $id;
		private string $name;
		private Datetime $createAt;
		

		public static function create(
			Uuid $id,
			LearningSupportTeamCategoryName $name,
			DateTimeInterface $createAt,
			LearningSupportTeamCategoryNameIsAvailableSpecification $learningSupportTeamCategoryNameIsAvailableSpecification
		): self {
			$learningSupportTeamCategory = new self();
			$learningSupportTeamCategory->id = $id->value();
			$learningSupportTeamCategory->name = $name->value();
			$learningSupportTeamCategory->createAt = $createAt;
			$learningSupportTeamCategory->recordThat(LearningSupportTeamCategoryWasCreated::with($id->value(), $name->value()));
			
			if (!$learningSupportTeamCategoryNameIsAvailableSpecification->isSatisfiedBy($learningSupportTeamCategory)) {
				throw new UnavailableLearningSupportTeamCategoryName($name);
			}
			return $learningSupportTeamCategory;
		}
		
		public function changeDetails(
			LearningSupportTeamCategoryName $aNewName,
			LearningSupportTeamCategoryNameIsAvailableSpecification $learningSupportTeamCategoryNameIsAvailableSpecification
		): self {
			$this->changeName($aNewName, $learningSupportTeamCategoryNameIsAvailableSpecification);
			return $this;
		}
		
		private function changeName(
			LearningSupportTeamCategoryName $aNewName,
			LearningSupportTeamCategoryNameIsAvailableSpecification $learningSupportTeamCategoryNameIsAvailableSpecification
		): void {
			if ($aNewName->isEqual($this->name)) {
				return;
			}
			
			$this->name = $aNewName->value();
			
			if (!$learningSupportTeamCategoryNameIsAvailableSpecification->isSatisfiedBy($this)) {
				throw new UnavailableLearningSupportTeamCategoryName($aNewName);
			}
		}
		
		public function id(): String
		{
			return $this->id;
		}
		
		public function name(): string
		{
			return $this->name;
		}
		
		public function createAt(): DateTime
		{
			return $this->createAt;
		}
	}
