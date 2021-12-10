<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Application\Get\Single;
	
	use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupport;
	use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
	use App\Backoffice\OfficeOfLearningSupport\Domain\Exception\OfficeOfLearningSupportNotExist;
	use App\Shared\Domain\ValueObject\Uuid;
	
	final class OfficeOfLearningSupportFinder
	{
		const NOT_FOUND = null;
		private OfficeOfLearningSupportRepository $repository;
		
		public function __construct(OfficeOfLearningSupportRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $id): OfficeOfLearningSupport
		{
			$id = new Uuid($id);
			
			$officeOfLearningSupport = $this->repository->search($id);
			
			if (self::NOT_FOUND === $officeOfLearningSupport) {
				throw new OfficeOfLearningSupportNotExist(($id)->value());
			}
			
			return $officeOfLearningSupport;
		}
	}