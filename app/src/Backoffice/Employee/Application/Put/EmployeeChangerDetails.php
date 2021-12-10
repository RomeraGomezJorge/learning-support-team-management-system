<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Employee\Application\Put;
  
  use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
  use App\Backoffice\Employee\Application\Shared\AttachFiles;
  use App\Backoffice\Employee\Domain\EmployeeRepository;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeAddress;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeEmail;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeIdentityCard;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeName;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeePhone;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeSurname;
  use App\Backoffice\EmploymentContract\Application\Get\Single\EmploymentContractFinder;
  use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
  use App\Backoffice\EmploymentContract\Domain\EmploymentContractRepository;
  use App\Backoffice\JobDesignation\Application\Get\Single\JobDesignationFinder;
  use App\Backoffice\JobDesignation\Domain\JobDesignation;
  use App\Backoffice\JobDesignation\Domain\JobDesignationRepository;
  use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
  use DateTime;
  use Symfony\Contracts\Translation\TranslatableInterface;
  use Symfony\Contracts\Translation\TranslatorInterface;
  
  final class EmployeeChangerDetails {
    
    private EmployeeRepository $repository;
    
    private EmployeeFinder  $finder;
    
    private EmployeeNameIsAvailableSpecification $nameIsAvailableSpecification;
    
    private JobDesignationFinder $jobDesignationFinder;
    
    private EmploymentContractFinder $employmentContractFinder;
    
    private LearningSupportTeamFinder $learningSupportTeamFinder;
    
    
  
    public function __construct(
      EmployeeRepository $repository,
      JobDesignationRepository $jobDesignationRepository,
      EmploymentContractRepository $employmentContractRepository,
      LearningSupportTeamRepository $learningSupportTeamRepository
    ) {
      $this->repository = $repository;
      $this->finder = new EmployeeFinder($repository);
      $this->jobDesignationFinder = new JobDesignationFinder($jobDesignationRepository);
      $this->employmentContractFinder = new EmploymentContractFinder($employmentContractRepository);
      $this->learningSupportTeamFinder = new  LearningSupportTeamFinder($learningSupportTeamRepository);
    }
    
    public function __invoke(
      string $id,
      string $newName,
      string $newSurname,
      ?string $newIdentityCard,
      ?string $newPhone,
      ?string $newEmail,
      ?string $newHireDate,
      ?string $newTerminationDate,
      ?string $newAddress,
      string $newJobDesignationId,
      string $newEmploymentContractId,
      string $newShiftWork,
      ?array $newLearningSupportTeam,
      ?string $newBirthday
    ): void {
      $jobDesignation = $this->jobDesignationFinder->__invoke($newJobDesignationId);
      $employmentContract = $this->employmentContractFinder->__invoke($newEmploymentContractId);
      $employee = $this->finder->__invoke($id);
      $updateAt = new DateTime();
      
      $hideDate = $newHireDate === NULL
        ? NULL
        : new DateTime($newHireDate);
      
      $terminationDate = $newTerminationDate === NULL
        ? NULL
        : new DateTime($newTerminationDate );
      
      $birthday = $newBirthday === NULL
        ? NULL
        : new DateTime($newBirthday );
  
      $employee->changeDetails(
        new EmployeeName($newName),
        new EmployeeSurname($newSurname),
        new EmployeeIdentityCard($newIdentityCard),
        new EmployeePhone($newPhone),
        new EmployeeEmail($newEmail),
        $hideDate,
        $terminationDate,
        new EmployeeAddress($newAddress),
        $jobDesignation,
        $employmentContract,
        new EmployeeShitWork($newShiftWork),
        $birthday,
        $updateAt
      );
      
      foreach ($employee->learningSupportTeam() as $team) {
        $employee->removeLearningSupportTeam($team);
      }
      
      if ($newLearningSupportTeam) {
        foreach ($newLearningSupportTeam as $newTeam) {
          $employee->addLearningSupportTeam(
            $this->learningSupportTeamFinder->__invoke($newTeam)
          );
        }
      }
      
      $this->repository->save($employee);
    }
    
  }