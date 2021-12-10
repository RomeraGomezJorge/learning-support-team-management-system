<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Domain;
	
	class OfficeOfLearningSupportInDistrictNameIsAvailableSpecification
	{
		private OfficeOfLearningSupportInDistrictRepository $repository;
		
		public function __construct(OfficeOfLearningSupportInDistrictRepository $repository)
		{
			$this->repository = $repository;
		}
		
		public function isSatisfiedBy(OfficeOfLearningSupportInDistrict $officeOfLearningSupportInDistrict): bool
		{
			return $this->repository->isAvailable(array('name' => $officeOfLearningSupportInDistrict->name()));
		}
	}