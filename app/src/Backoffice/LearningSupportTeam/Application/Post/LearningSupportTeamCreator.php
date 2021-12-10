<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\LearningSupportTeam\Application\Post;
  
  use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
  use App\Backoffice\Employee\Domain\EmployeeRepository;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamNameIsAvailableSpecification;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
  use App\Backoffice\LearningSupportTeam\Domain\ValueObject\LearningSupportTeamName;
  use App\Backoffice\LearningSupportTeamCategory\Application\Get\Single\LearningSupportTeamCategoryFinder;
  use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;
  use App\Backoffice\OfficeOfLearningSupport\Application\Get\Single\OfficeOfLearningSupportFinder;
  use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Single\SchoolAssistedByLearningSupportTeamFinder;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
  use App\Shared\Domain\Bus\Event\EventBus;
  use App\Shared\Domain\ValueObject\Uuid;
  use DateTime;
  
  
  final class LearningSupportTeamCreator {
    
    const MANAGER_IS_NOT_SET = NULL;
    
    private LearningSupportTeamRepository $repository;
    
    private LearningSupportTeamNameIsAvailableSpecification $nameIsAvailableSpecification;
    
    private EventBus $bus;
    
    private SchoolAssistedByLearningSupportTeamFinder $schoolAssistedByLearningSupportTeamFinder;
    
    private OfficeOfLearningSupportFinder $officeOfLearningSupportFinder;
    
    private EmployeeFinder $employeeFinder;
    
    private LearningSupportTeamCategoryFinder $learningSupportTeamCategoryFinder;
    
    public function __construct(
      LearningSupportTeamRepository $repository,
      SchoolAssistedByLearningSupportTeamRepository $schoolAssistedByLearningSupportTeamRepository,
      OfficeOfLearningSupportRepository $officeOfLearningSupportRepository,
      EmployeeRepository $employeeRepository,
      LearningSupportTeamCategoryRepository $learningSupportTeamCategoryRepository,
      LearningSupportTeamNameIsAvailableSpecification $nameIsAvailableSpecification,
      EventBus $bus
    ) {
      $this->repository = $repository;
      $this->schoolAssistedByLearningSupportTeamFinder = new SchoolAssistedByLearningSupportTeamFinder($schoolAssistedByLearningSupportTeamRepository);
      $this->officeOfLearningSupportFinder = new OfficeOfLearningSupportFinder($officeOfLearningSupportRepository);
      $this->employeeFinder = new EmployeeFinder($employeeRepository);
      $this->learningSupportTeamCategoryFinder = new LearningSupportTeamCategoryFinder($learningSupportTeamCategoryRepository);
      $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
      $this->bus = $bus;
    }
    
    public function __invoke(
      string $id,
      string $name,
      ?string $managerId,
      string $officeOfLearningSupportId,
      ?array $schoolsAssistedByLearningSupportTeam,
      string $learningSupportTeamId
    ) {
      $createAt = new DateTime();
      
      $employee = $managerId === self::MANAGER_IS_NOT_SET
        ? self::MANAGER_IS_NOT_SET
        : $this->employeeFinder->__invoke($managerId);
      
      $officeOfLearningSupport = $this->officeOfLearningSupportFinder->__invoke($officeOfLearningSupportId);
      
      $learningSupportTeam = $this->learningSupportTeamCategoryFinder->__invoke($learningSupportTeamId);
      
      $learningSupportTeam = LearningSupportTeam::create(
        new Uuid($id),
        new LearningSupportTeamName($name),
        $employee,
        $officeOfLearningSupport,
        $learningSupportTeam,
        $createAt,
        $this->nameIsAvailableSpecification
      );
      
      if ($schoolsAssistedByLearningSupportTeam) {
        foreach ($schoolsAssistedByLearningSupportTeam as $school) {
          $learningSupportTeam->addSchoolAssistedByLearningSupportTeam(
            $this->schoolAssistedByLearningSupportTeamFinder->__invoke($school)
          );
        }
      }
      
      $this->repository->save($learningSupportTeam);
      
      $this->bus->publish(...$learningSupportTeam->pullDomainEvents());
    }
    
  }