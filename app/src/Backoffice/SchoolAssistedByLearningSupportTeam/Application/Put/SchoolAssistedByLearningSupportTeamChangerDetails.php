<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Put;
  
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Single\SchoolAssistedByLearningSupportTeamFinder;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamNameIsAvailableSpecification;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamBiography;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamName;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\ValueObject\SchoolAssistedByLearningSupportTeamNumber;
  
  final class SchoolAssistedByLearningSupportTeamChangerDetails {
    
    private SchoolAssistedByLearningSupportTeamRepository $repository;
    
    private SchoolAssistedByLearningSupportTeamFinder  $finder;
    
    public function __construct(SchoolAssistedByLearningSupportTeamRepository $repository) {
      $this->repository = $repository;
      $this->finder = new SchoolAssistedByLearningSupportTeamFinder($repository);
    }
    
    public function __invoke(
      string $id,
      string $newName,
      string $newNumber
    ): void {
      $schoolsAssistedByLearningSupportTeam = $this->finder->__invoke($id);
      
      $schoolsAssistedByLearningSupportTeam->changeDetails(
        new SchoolAssistedByLearningSupportTeamName($newName),
        new SchoolAssistedByLearningSupportTeamNumber($newNumber)
      );
      
      $this->repository->save($schoolsAssistedByLearningSupportTeam);
    }
    
  }