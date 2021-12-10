<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Document\Application\Post;
  
  
  use App\Backoffice\Document\Application\Shared\AttachFiles;
  use App\Backoffice\Document\Domain\Document;
  use App\Backoffice\Document\Domain\DocumentRepository;
  use App\Backoffice\Document\Domain\ValueObject\DocumentName;
  use App\Backoffice\Document\Domain\ValueObject\DocumentNumber;
  use App\Backoffice\DocumentCategory\Application\Get\Single\DocumentCategoryFinder;
  use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;
  use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
  use App\Backoffice\Employee\Domain\EmployeeRepository;
  use App\Shared\Domain\Bus\Event\EventBus;
  use App\Shared\Domain\ValueObject\Uuid;
  use DateTime;
  
  
  final class DocumentCreator {
    
    private DocumentRepository $repository;
    
    private DocumentNameIsAvailableSpecification $nameIsAvailableSpecification;
    
    private DocumentCategoryFinder $documentCategoryFinder;
    
    private AttachFiles $attachFiles;
    
    private EventBus $bus;

    private EmployeeFinder $employeeFinder;
  
    public function __construct(
      DocumentRepository $repository,
      DocumentCategoryRepository $documentCategoryRepository,
      AttachFiles $attachFiles,
      EmployeeRepository $employeeRepository,
      EventBus $bus
    ) {
      $this->repository = $repository;
      $this->documentCategoryFinder = new DocumentCategoryFinder($documentCategoryRepository);
      $this->attachFiles = $attachFiles;
      $this->employeeFinder = new EmployeeFinder($employeeRepository);
      $this->bus = $bus;
    }
    
    public function __invoke(
      string $id,
      ?string $name,
      ?string $number,
      string $documentCategoryId,
      ?array $employees,
      ?array $attachment
    ) {
      $id = new Uuid($id);
      
      $createAt = new DateTime();
      
      $documentCategory = $this->documentCategoryFinder->__invoke($documentCategoryId);
      
      $document = Document::create(
        $id,
        new DocumentName($name),
        new DocumentNumber($number),
        $documentCategory,
        $createAt
      );
      
      if (!is_null($attachment)) {
        $this->attachFiles->__invoke($attachment, $document);
      }
  
      if ($employees) {
        foreach ($employees as $employee) {
          $document->addEmployee(
            $this->employeeFinder->__invoke($employee)
          );
        }
      }      
      
      $this->repository->save($document);
      
      $this->bus->publish(...$document->pullDomainEvents());
    }
    
  }