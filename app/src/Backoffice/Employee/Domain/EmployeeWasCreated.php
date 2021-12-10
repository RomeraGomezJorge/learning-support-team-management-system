<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Employee\Domain;
  
  use App\Shared\Domain\Bus\Event\DomainEvent;
  
  final class EmployeeWasCreated extends DomainEvent {
    
    private string $id;
    
    private string $name;
    
    private string $surname;
    
    private string $identityCard;
    
    private string $phone;
    
    private string $email;
    
    private string $hireDate;
    
    private string $terminationDate;
    
    private string $address;
    
    private string $jobDesignation;
    
    private string $employmentContract;
    
    private string $shiftWork;
    
    private string $birthday;
    
    private function __construct(
      string $id,
      string $name,
      string $surname,
      string $identityCard,
      string $phone,
      string $email,
      string $hireDate,
      string $terminationDate,
      string $address,
      string $jobDesignation,
      string $employmentContract,
      string $shiftWork,
      string $birthday,
      string $eventId = NULL,
      string $occurredOn = NULL
    ) {
      parent::__construct($id, $eventId, $occurredOn);
      $this->name = $name;
      $this->surname = $surname;
      $this->identityCard = $identityCard;
      $this->phone = $phone;
      $this->email = $email;
      $this->hireDate = $hireDate;
      $this->terminationDate = $terminationDate;
      $this->address = $address;
      $this->jobDesignation = $jobDesignation;
      $this->employmentContract = $employmentContract;
      $this->shiftWork = $shiftWork;
      $this->birthday = $birthday;
    }
    
    public static function with(
      string $id,
      string $name,
      string $surname,
      string $identityCard,
      string $phone,
      string $email,
      string $hireDate,
      string $terminationDate,
      string $address,
      string $jobDesignation,
      string $employmentContract,
      string $shiftWork,
      string $birthday
    ): self {
      return new self(
        $id,
        $name,
        $surname,
        $identityCard,
        $phone,
        $email,
        $hireDate,
        $terminationDate,
        $address,
        $jobDesignation,
        $employmentContract,
        $shiftWork,
        $birthday);
    }
    
    public static function eventName(): string {
      return 'employee.was.created';
    }
    
    public function name(): string {
      return $this->name;
    }
    
    public function surname(): string {
      return $this->surname;
    }
    
    public function identityCard(): string {
      return $this->identityCard;
    }
    
    public function phone(): string {
      return $this->phone;
    }
    
    public function email(): string {
      return $this->email;
    }
    
    public function hireDate(): string {
      return $this->hireDate;
    }
    
    public function terminationDate(): string {
      return $this->terminationDate;
    }
    
    public function address(): string {
      return $this->address;
    }
    
    public function jobDesignation(): string {
      return $this->jobDesignation;
    }
    
    public function employmentContract(): string {
      return $this->employmentContract;
    }
    
    public function shiftWork(): string {
      return $this->shiftWork;
    }
    
    public function birthday(): string {
      return $this->birthday;
    }
    
  }
