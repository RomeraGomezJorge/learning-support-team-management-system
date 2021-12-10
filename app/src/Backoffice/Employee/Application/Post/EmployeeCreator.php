<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Employee\Application\Post;
  
  use App\Backoffice\Employee\Domain\Employee;
  use App\Backoffice\Employee\Domain\EmployeeRepository;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeAddress;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeEmail;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeIdentityCard;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeName;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeePhone;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeSurname;
  use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
  use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
  use App\Backoffice\JobDesignation\Application\Get\Single\JobDesignationFinder;
  use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
  use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
  use App\Shared\Domain\Bus\Event\EventBus;
  use App\Shared\Domain\ValueObject\Uuid;
  use DateTime;
  
  
  final class EmployeeCreator {
    
    private EmployeeRepository $repository;
    
    private EmployeeNameIsAvailableSpecification $nameIsAvailableSpecification;
    
    private EventBus $bus;
    
    private EmploymentContractFinder $employmentContract;
    
    private JobDesignationFinder $jobDesignationFinder;
    
    private LearningSupportTeamFinder $learningSupportTeamFinder;
    
    public function __construct(
      EmployeeRepository $repository,
      JobDesignationRepository $jobDesignationRepository,
      EmploymentContractRepository $employmentContractRepository,
      LearningSupportTeamRepository $learningSupportTeamRepository,
      EventBus $bus
    ) {
      $this->repository = $repository;
      $this->jobDesignationFinder = new JobDesignationFinder($jobDesignationRepository);
      $this->employmentContract = new EmploymentContractFinder($employmentContractRepository);
      $this->learningSupportTeamFinder = new LearningSupportTeamFinder($learningSupportTeamRepository);
      $this->bus = $bus;
    }
    
    public function __invoke(
      string $id,
      string $name,
      string $surname,
      ?string $identityCard,
      ?string $phone,
      ?string $email,
      ?string $hireDate,
      ?string $terminationDate,
      ?string $address,
      string $jobDesignationId,
      string $employmentContractId,
      string $shitWork,
      ?array $learningSupportTeam,
      ?string $birthday
    ) {
      $createAt = new DateTime();
      $jobDesignation = $this->jobDesignationFinder->__invoke($jobDesignationId);
      $employmentContract = $this->employmentContract->__invoke($employmentContractId);
      
      $hideDate = $hireDate === NULL
        ? NULL
        : new DateTime($hireDate);
      
      $terminationDate = $terminationDate === NULL
        ? NULL
        : new DateTime($terminationDate);
      
      $birthday = $birthday === NULL
        ? NULL
        : new DateTime($birthday);
      
      
      $employee = Employee::create(
        new Uuid($id),
        new EmployeeName($name),
        new EmployeeSurname($surname),
        new EmployeeIdentityCard($identityCard),
        new EmployeePhone($phone),
        new EmployeeEmail($email),
        $hideDate,
        $terminationDate,
        new EmployeeAddress($address),
        $jobDesignation,
        $employmentContract,
        new EmployeeShitWork($shitWork),
        $birthday,
        $createAt
      );
      
      if ($learningSupportTeam) {
        foreach ($learningSupportTeam as $team) {
          $employee->addLearningSupportTeam(
            $this->learningSupportTeamFinder->__invoke($team)
          );
        }
      }
      
      $this->repository->save($employee);
      
      $this->bus->publish(...$employee->pullDomainEvents());
    }
    
  }