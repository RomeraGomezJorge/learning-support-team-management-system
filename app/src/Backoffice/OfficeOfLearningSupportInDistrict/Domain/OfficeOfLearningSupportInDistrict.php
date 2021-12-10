<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain;
	
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\Exception\UnavailableOfficeOfLearningSupportInDistrictName;
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\ValueObject\OfficeOfLearningSupportInDistrictName;
	use App\Shared\Domain\Aggregate\AggregateRoot;
	use App\Shared\Domain\SlugGenerator;
	use App\Shared\Domain\ValueObject\Uuid;
	use DateTime;
	use DateTimeInterface;
	
	class OfficeOfLearningSupportInDistrict extends AggregateRoot
	{
		private string $id;
		private string $name;
		private Datetime $createAt;
		

		public static function create(
			Uuid $id,
			OfficeOfLearningSupportInDistrictName $name,
			DateTimeInterface $createAt,
			OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $officeOfLearningSupportInDistrictnNameIsAvailableSpecification
		): self {
			$officeOfLearningSupportInDistrict = new self();
			$officeOfLearningSupportInDistrict->id = $id->value();
			$officeOfLearningSupportInDistrict->name = $name->value();
			$officeOfLearningSupportInDistrict->createAt = $createAt;
			$officeOfLearningSupportInDistrict->recordThat(OfficeOfLearningSupportInDistrictWasCreated::with($id->value(), $name->value()));
			
			if (!$officeOfLearningSupportInDistrictnNameIsAvailableSpecification->isSatisfiedBy($officeOfLearningSupportInDistrict)) {
				throw new UnavailableOfficeOfLearningSupportInDistrictName($name);
			}
			return $officeOfLearningSupportInDistrict;
		}
		
		public function changeDetails(
			OfficeOfLearningSupportInDistrictName $aNewName,
			OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $officeOfLearningSupportInDistrictnNameIsAvailableSpecification
		): self {
			$this->changeName($aNewName, $officeOfLearningSupportInDistrictnNameIsAvailableSpecification);
			return $this;
		}
		
		private function changeName(
			OfficeOfLearningSupportInDistrictName $aNewName,
			OfficeOfLearningSupportInDistrictNameIsAvailableSpecification $officeOfLearningSupportInDistrictnNameIsAvailableSpecification
		): void {
			if ($aNewName->isEqual($this->name)) {
				return;
			}
			
			$this->name = $aNewName->value();
			
			if (!$officeOfLearningSupportInDistrictnNameIsAvailableSpecification->isSatisfiedBy($this)) {
				throw new UnavailableOfficeOfLearningSupportInDistrictName($aNewName);
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
