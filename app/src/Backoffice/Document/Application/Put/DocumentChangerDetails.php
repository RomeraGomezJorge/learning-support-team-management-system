<?php

  declare(strict_types=1);

  namespace App\Backoffice\Document\Application\Put;

  use App\Backoffice\Document\Application\Get\Single\DocumentFinder;
  use App\Backoffice\Document\Application\Shared\AttachFiles;
  use App\Backoffice\Document\Domain\DocumentRepository;
  use App\Backoffice\Document\Domain\ValueObject\DocumentName;
  use App\Backoffice\Document\Domain\ValueObject\DocumentNumber;
  use App\Backoffice\DocumentCategory\Application\Get\Single\DocumentCategoryFinder;
  use App\Backoffice\DocumentCategory\Domain\DocumentCategoryRepository;
  use App\Backoffice\Employee\Application\Get\Single\EmployeeFinder;
  use App\Backoffice\Employee\Domain\EmployeeRepository;

  final class DocumentChangerDetails
{
    private DocumentRepository $repository;

    private DocumentFinder $finder;

    private DocumentCategoryFinder $documentCategoryFinder;

    private AttachFiles $attachFiles;

    public function __construct(
        DocumentRepository $repository,
        DocumentCategoryRepository $documentCategoryRepository,
        AttachFiles $attachFiles,
        EmployeeRepository $employeeRepository
    ) {
        $this->repository             = $repository;
        $this->finder                 = new DocumentFinder($repository);
        $this->documentCategoryFinder = new DocumentCategoryFinder($documentCategoryRepository);
        $this->attachFiles            = $attachFiles;
        $this->employeeFinder         = new EmployeeFinder($employeeRepository);
    }

    public function __invoke(
        string $id,
        string $newAddress,
        ?string $newPhone,
        string $documentCategoryId,
        ?array $employees,
        ?array $attachment
    ): void {
        $document = $this->finder->__invoke($id);

        $documentCategory = $this->documentCategoryFinder->__invoke($documentCategoryId);

        $document->changeDetails(
            new DocumentName($newAddress),
            new DocumentNumber($newPhone),
            $documentCategory,
        );

        if (!is_null($attachment)) {
            $this->attachFiles->__invoke($attachment, $document);
        }

        if ($employees) {
            if ($document->employees()) {
                foreach ($document->employees() as $employee) {
                    $document->removeEmployee($employee);
                }
            }


            foreach ($employees as $employee) {
                $document->addEmployee(
                    $this->employeeFinder->__invoke($employee)
                );
            }
        }


        $this->repository->save($document);
    }
}
