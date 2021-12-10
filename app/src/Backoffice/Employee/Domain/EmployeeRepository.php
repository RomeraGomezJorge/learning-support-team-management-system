<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Employee\Domain;
  
  use App\Backoffice\EmploymentContract\Domain\EmploymentContract;
  use App\Backoffice\JobDesignation\Domain\JobDesignation;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
  use App\Shared\Domain\Criteria\Criteria;
  use App\Shared\Domain\ValueObject\Uuid;

  interface EmployeeRepository {
    
    public function save(Employee $jobDesignation): void;
    
    public function search(Uuid $id): ?Employee;
    
    public function searchAll(): array;
    
    public function matching(
      Criteria $criteria,
      ?JobDesignation $jobDesignation,
      ?EmploymentContract $employmentContract,
      ?LearningSupportTeam $learningSupportTeam
    ): array;
    
    public function totalMatchingRows(
      Criteria $criteria,
      ?JobDesignation $jobDesignation,
      ?EmploymentContract $employmentContract,
      ?LearningSupportTeam $learningSupportTeam
    ): int;
    
    public function delete(Employee $jobDesignation): void;
    
  }