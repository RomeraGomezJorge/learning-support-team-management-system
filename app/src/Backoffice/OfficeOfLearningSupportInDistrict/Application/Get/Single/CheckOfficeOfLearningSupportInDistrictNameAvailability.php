<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single;
	
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Domain\OfficeOfLearningSupportInDistrictRepository;
	
	final class CheckOfficeOfLearningSupportInDistrictNameAvailability
	{
		private OfficeOfLearningSupportInDistrictRepository $repository;
		
		public function __construct(OfficeOfLearningSupportInDistrictRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function __invoke(string $name): bool
		{
			return $this->repository->isAvailable(['name' => $name]);
		}
	}