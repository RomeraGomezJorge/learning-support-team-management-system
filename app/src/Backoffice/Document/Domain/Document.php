<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Domain;
	
	use App\Backoffice\Document\Domain\ValueObject\DocumentName;
	use App\Backoffice\Document\Domain\ValueObject\DocumentNumber;
	use App\Backoffice\DocumentCategory\Domain\DocumentCategory;
  use App\Backoffice\Document\Domain\ValueObject\Attachment\Attachment;
  use App\Backoffice\Employee\Domain\Employee;
  use App\Shared\Domain\Aggregate\AggregateRoot;
	use App\Shared\Domain\ValueObject\Uuid;
	use DateTime;
	use DateTimeInterface;
	use Doctrine\Common\Collections\ArrayCollection;
  use Doctrine\Common\Collections\Collection;
  
  class Document extends AggregateRoot
	{
		private string $id;
		private string $name;
		private ?string $number;
		private DocumentCategory $documentCategory;
		private Datetime $createAt;
    private $attachment;
    private $employee;
  
    public function __construct()
    {
      $this->employee = new ArrayCollection();
    }
		
		public static function create(
			Uuid $id,
			DocumentName $name,
			?DocumentNumber $number,
			DocumentCategory $documentCategory,
			DateTimeInterface $createAt
		): self {
			$document = new self();
			$document->id = $id->value();
			$document->name = $name->value();
			$document->number = $number->value();
			$document->documentCategory = $documentCategory;
			$document->createAt = $createAt;
			$document->recordThat(DocumentWasCreated::with(
				$id->value(),
				$name->value(),
				$number->value(),
				$documentCategory->id()));
			
			return $document;
		}
		
		public function changeDetails(
			DocumentName $newName,
			?DocumentNumber $newNumber,
			DocumentCategory $newDocumentCategory
		): self {
			$this->name = $newName->value();
			$this->number = $newNumber->value();
			$this->documentCategory = $newDocumentCategory;
			
			return $this;
		}
		
		public function id(): string
		{
			return $this->id;
		}
		
		public function name(): ?string
		{
			return $this->name;
		}
		
		public function number(): ?string
		{
			return $this->number;
		}
		
		public function documentCategory(): DocumentCategory
		{
			return $this->documentCategory;
		}
		
		public function createAt(): DateTime
		{
			return $this->createAt;
		}
    
    public function attachment():?array
    {
      return $this->attachment;
    }
    
    public function addAttachment(Attachment $attachment):self
    {
      $this->attachment[] = $attachment->toArray();
      
      return $this;
    }
    
    public function removeAttachment(Attachment $attachmentToRemove): self
    {
      $currentAttachments = new ArrayCollection($this->attachment);
      
      if ($currentAttachments->contains($attachmentToRemove->toArray())) {
        $currentAttachments->removeElement($attachmentToRemove->toArray());
      }
      
      $this->attachment = $currentAttachments->toArray();
      
      return $this;
    }
  
    /**
     * @return ArrayCollection|\App\Backoffice\Employee\Domain\Employee[]
     */
    public function employees(): Collection
    {
      return $this->employee;
    }
  
    public function addEmployee(?Employee $employee): self
    {
      if (!$this->employee->contains($employee)) {
        $this->employee[] = $employee;
      }
      return $this;
    }
  
    public function removeEmployee(?Employee $employee): self
    {
      if ($this->employee->contains($employee)) {
        $this->employee->removeElement($employee);
      }
    
      return $this;
    }

	}
