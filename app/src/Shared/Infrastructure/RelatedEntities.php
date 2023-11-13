<?php

namespace App\Shared\Infrastructure;

use App\Backoffice\DocumentCategory\Application\Get\Collection\DocumentCategoryByCriteriaSearcher;
use App\Backoffice\Employee\Application\Get\Collection\EmployeeByCriteriaSearcher;
use App\Backoffice\EmploymentContract\Application\Get\Collection\EmploymentContractByCriteriaSearcher;
use App\Backoffice\JobDesignation\Application\Get\Collection\JobDesignationByCriteriaSearcher;
use App\Backoffice\LearningSupportTeam\Application\Get\Collection\LearningSupportTeamByCriteriaSearcher;
use App\Backoffice\LearningSupportTeamCategory\Application\Get\Collection\LearningSupportTeamCategoryByCriteriaSearcher;
use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Collection\OfficeOfLearningSupportInDistrictByCriteriaSearcher;

final class RelatedEntities
{
    const DISPLAY_ALL_ITEMS = [];
    const SORT_A_LIST_BY_NAME = 'name';
    const SORT_A_LIST_ALPHABETICALLY = 'asc';
    const LIST_BEGIN_ON_0 = 0;
    const LIST_END_ON_1000 = 1000;
    private OfficeOfLearningSupportInDistrictByCriteriaSearcher $officeOfLearningSupportInDistrictByCriteriaSearcher;
    private JobDesignationByCriteriaSearcher $jobDesignationByCriteriaSearcher;
    private EmploymentContractByCriteriaSearcher $employmentContractByCriteriaSearcher;
    private LearningSupportTeamCategoryByCriteriaSearcher $learningSupportTeamCategoryByCriteriaSearcher;
    private LearningSupportTeamByCriteriaSearcher $learningSupportTeamByCriteriaSearcher;
    private DocumentCategoryByCriteriaSearcher $documentCategoryByCriteriaSearcher;
    private EmployeeByCriteriaSearcher $employeeByCriteriaSearcher;

    public function __construct(
        OfficeOfLearningSupportInDistrictByCriteriaSearcher $officeOfLearningSupportInDistrictByCriteriaSearcher,
        JobDesignationByCriteriaSearcher $jobDesignationByCriteriaSearcher,
        EmploymentContractByCriteriaSearcher $employmentContractByCriteriaSearcher,
        LearningSupportTeamCategoryByCriteriaSearcher $learningSupportTeamCategoryByCriteriaSearcher,
        LearningSupportTeamByCriteriaSearcher $learningSupportTeamByCriteriaSearcher,
        DocumentCategoryByCriteriaSearcher $documentCategoryByCriteriaSearcher,
        EmployeeByCriteriaSearcher $employeeByCriteriaSearcher
    ) {
        $this->officeOfLearningSupportInDistrictByCriteriaSearcher = $officeOfLearningSupportInDistrictByCriteriaSearcher;
        $this->jobDesignationByCriteriaSearcher                    = $jobDesignationByCriteriaSearcher;
        $this->employmentContractByCriteriaSearcher                = $employmentContractByCriteriaSearcher;
        $this->learningSupportTeamCategoryByCriteriaSearcher       = $learningSupportTeamCategoryByCriteriaSearcher;
        $this->learningSupportTeamByCriteriaSearcher               = $learningSupportTeamByCriteriaSearcher;
        $this->documentCategoryByCriteriaSearcher                  = $documentCategoryByCriteriaSearcher;
        $this->employeeByCriteriaSearcher                          = $employeeByCriteriaSearcher;
    }

    public function districtsSortedAlphabetically(): array
    {
        return $this->officeOfLearningSupportInDistrictByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }

    public function jobDesignationsSortedAlphabetically(): array
    {
        return $this->jobDesignationByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }

    public function employmentContractsSortedAlphabetically(): array
    {
        return $this->employmentContractByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }

    public function learningSupportTeamCategoriesSortedAlphabetically(): array
    {
        return $this->learningSupportTeamCategoryByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }

    public function learningSupportTeamsSortedAlphabetically(): array
    {
        return $this->learningSupportTeamByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }

    public function documentCategoriesSortedAlphabetically(): array
    {
        return $this->documentCategoryByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }

    public function employeesSortedAlphabetically(): array
    {
        return $this->employeeByCriteriaSearcher->__invoke(
            self::DISPLAY_ALL_ITEMS,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );
    }
}
