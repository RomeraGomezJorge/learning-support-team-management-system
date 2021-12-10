<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\LearningSupportTeam\Application\Put;
  
  use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
  use App\Backoffice\Employee\Domain\EmployeeRepository;
  use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamNameIsAvailableSpecification;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeamRepository;
  use App\Backoffice\LearningSupportTeam\Domain\ValueObject\LearningSupportTeamName;
  use App\Backoffice\LearningSupportTeamCategory\Application\Get\Single\LearningSupportTeamCategoryFinder;
  use App\Backoffice\LearningSupportTeamCategory\Domain\LearningSupportTeamCategoryRepository;
  use App\Backoffice\OfficeOfLearningSupport\Application\Get\Single\OfficeOfLearningSupportFinder;
  use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Single\SchoolAssistedByLearningSupportTeamFinder;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeam;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
  
  
  final class LearningSupportTeamChangerDetails {
  
    const MANAGER_IS_NOT_SET = NULL;
  
    private LearningSupportTeamRepository $repository;
    
    private LearningSupportTeamFinder  $finder;
    
    private LearningSupportTeamNameIsAvailableSpecification $nameIsAvailableSpecification;
    
    private SchoolAssistedByLearningSupportTeamFinder $schoolAssistedByLearningSupportTeamFinder;
    
    private OfficeOfLearningSupportFinder $officeOfLearningSupportFinder;
    
    private EmployeeFinder  $employeeFinder;
    
    private LearningSupportTeamCategoryFinder $learningSupportTeamCategoryFinder;
    
    public function __construct(
      LearningSupportTeamRepository $repository,
      SchoolAssistedByLearningSupportTeamRepository $schoolAssistedByLearningSupportTeamRepository,
      OfficeOfLearningSupportRepository $officeOfLearningSupportRepository,
      EmployeeRepository $employeeRepository,
      LearningSupportTeamCategoryRepository $learningSupportTeamCategoryRepository,
      LearningSupportTeamNameIsAvailableSpecification $nameIsAvailableSpecification
    ) {
      $this->repository = $repository;
      $this->schoolAssistedByLearningSupportTeamFinder = new SchoolAssistedByLearningSupportTeamFinder($schoolAssistedByLearningSupportTeamRepository);
      $this->finder = new LearningSupportTeamFinder($repository);
      $this->employeeFinder = new EmployeeFinder($employeeRepository);
      $this->officeOfLearningSupportFinder = new OfficeOfLearningSupportFinder($officeOfLearningSupportRepository);
      $this->learningSupportTeamCategoryFinder = new LearningSupportTeamCategoryFinder($learningSupportTeamCategoryRepository);
      $this->nameIsAvailableSpecification = $nameIsAvailableSpecification;
    }
    
    public function __invoke(
      string $id,
      string $newName,
      ?string $newManagerId,
      string $newOfficeOfLearningSupportId,
      ?array $newSchools,
      string $newLearningSupportTeamCategoryId
    ): void {
      $learningSupportTeam = $this->finder->__invoke($id);
      
      $employee = $newManagerId === self::MANAGER_IS_NOT_SET
        ?self::MANAGER_IS_NOT_SET
        :$this->employeeFinder->__invoke($newManagerId);
      
      $officeOfLearningSupport = $this->officeOfLearningSupportFinder->__invoke($newOfficeOfLearningSupportId);
      
      $learningSupportTeamCategory = $this->learningSupportTeamCategoryFinder->__invoke($newLearningSupportTeamCategoryId);
      
      $learningSupportTeam->changeDetails(
        new LearningSupportTeamName($newName),
        $employee,
        $officeOfLearningSupport,
        $learningSupportTeamCategory,
        $this->nameIsAvailableSpecification
      );
      
      if ($newSchools) {
        if ($learningSupportTeam->schoolsAssistedByLearningSupportTeam()) {
          foreach ($learningSupportTeam->schoolsAssistedByLearningSupportTeam() as $school) {
            $learningSupportTeam->removeSchoolsAssistedByLearningSupportTeam($school);
          }
        }

      
        foreach ($newSchools as $newSchool) {
          $learningSupportTeam->addSchoolAssistedByLearningSupportTeam(
            $this->schoolAssistedByLearningSupportTeamFinder->__invoke($newSchool)
          );
        }
      }
      
      
      $this->repository->save($learningSupportTeam);
    }
    
  }