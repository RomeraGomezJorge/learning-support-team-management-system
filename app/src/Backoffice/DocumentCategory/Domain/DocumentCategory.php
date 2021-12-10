<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\DocumentCategory\Domain;
	
	use App\Backoffice\DocumentCategory\Domain\Exception\UnavailableDocumentCategoryName;
	use App\Backoffice\DocumentCategory\Domain\ValueObject\DocumentCategoryName;
	use App\Shared\Domain\Aggregate\AggregateRoot;
	use App\Shared\Domain\SlugGenerator;
	use App\Shared\Domain\ValueObject\Uuid;
	use DateTime;
	use DateTimeInterface;
	
	class DocumentCategory extends AggregateRoot
	{
		private string $id;
		private string $name;
		private Datetime $createAt;
		

		public static function create(
			Uuid $id,
			DocumentCategoryName $name,
			DateTimeInterface $createAt,
			DocumentCategoryNameIsAvailableSpecification $documentCategoryNameIsAvailableSpecification
		): self {
			$documentCategory = new self();
			$documentCategory->id = $id->value();
			$documentCategory->name = $name->value();
			$documentCategory->createAt = $createAt;
			$documentCategory->recordThat(DocumentCategoryWasCreated::with($id->value(), $name->value()));
			
			if (!$documentCategoryNameIsAvailableSpecification->isSatisfiedBy($documentCategory)) {
				throw new UnavailableDocumentCategoryName($name);
			}
			return $documentCategory;
		}
		
		public function changeDetails(
			DocumentCategoryName $aNewName,
			DocumentCategoryNameIsAvailableSpecification $documentCategoryNameIsAvailableSpecification
		): self {
			$this->changeName($aNewName, $documentCategoryNameIsAvailableSpecification);
			return $this;
		}
		
		private function changeName(
			DocumentCategoryName $aNewName,
			DocumentCategoryNameIsAvailableSpecification $documentCategoryNameIsAvailableSpecification
		): void {
			if ($aNewName->isEqual($this->name)) {
				return;
			}
			
			$this->name = $aNewName->value();
			
			if (!$documentCategoryNameIsAvailableSpecification->isSatisfiedBy($this)) {
				throw new UnavailableDocumentCategoryName($aNewName);
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
