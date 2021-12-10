<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Domain;
	
	use App\Shared\Domain\Bus\Event\DomainEvent;
	
	final class OfficeOfLearningSupportWasCreated extends DomainEvent
	{
		private ?string $address;
		private ?string $phone;
		private string $officeOfLearningSupportInDistrict;
		
		private function __construct(
			string $id,
			?string $address,
			?string $phone,
			string $officeOfLearningSupportInDistrict,
			string $eventId = null,
			string $occurredOn = null
		) {
			parent::__construct($id, $eventId, $occurredOn);
			$this->address = $address;
			$this->phone = $phone;
			$this->officeOfLearningSupportInDistrict = $officeOfLearningSupportInDistrict;
		}
		
		public static function with(
		  string $id,
      string $address,
      string $phone,
      string $officeOfLearningSupportInDistrict): self
		{
			return new self($id, $address, $phone, $officeOfLearningSupportInDistrict);
		}
		
		public static function eventName(): string
		{
			return 'officeOfLearning.was.created';
		}
		
		public function address(): string
		{
			return $this->address;
		}
		
		public function phone(): string
		{
			return $this->address;
		}
		
		public function officeOfLearningSupportInDistrict():string
    {
      return $this->officeOfLearningSupportInDistrict;
    }

	}
