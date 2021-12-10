<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain;
	
	use App\Shared\Domain\Bus\Event\DomainEvent;
	
	final class SchoolAssistedByLearningSupportTeamWasCreated extends DomainEvent
	{
		private string $name;
		private string $number;
		
		private function __construct(
			string $id,
			string $name,
			string $number,
			string $eventId = null,
			string $occurredOn = null
		) {
			parent::__construct($id, $eventId, $occurredOn);
			$this->name = $name;
      $this->number = $number;
		}
		
		public static function with(string $id, string $name, string $number): self
		{
			return new self($id, $name, $number);
		}
		
		public static function eventName(): string
		{
			return 'school.was.created';
		}
		
		public function name(): string
		{
			return $this->name;
		}
		
		public function number(): string
		{
			return $this->number;
		}

	}
