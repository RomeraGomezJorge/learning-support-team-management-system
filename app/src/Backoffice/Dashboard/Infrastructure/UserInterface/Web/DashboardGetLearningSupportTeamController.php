<?php

declare(strict_types=1);

namespace App\Backoffice\Dashboard\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Infrastructure\UserInterface\Web\TwigTemplateConstants as EmployeeTwigTemplateConstants;
use App\Backoffice\LearningSupportTeam\Application\Get\Collection\LearningSupportTeamByCriteriaSearcher;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class DashboardGetLearningSupportTeamController extends WebController
{
    private const SORT_A_LIST_ALPHABETICALLY = 'asc';
    private const LIST_BEGIN_ON_0 = 0;
    private const LIST_END_ON_1000 = 1000;

    private LearningSupportTeamByCriteriaSearcher $learningSupportTeamByCriteriaSearcher;

    public function __construct(LearningSupportTeamByCriteriaSearcher $learningSupportTeamByCriteriaSearcher)
    {
        $this->learningSupportTeamByCriteriaSearcher = $learningSupportTeamByCriteriaSearcher;
    }

    public function __invoke(Request $request): Response
    {

        $filters[0]['field']    = 'id';
        $filters[0]['operator'] = '=';
        $filters[0]['value']    = $request->get('id');

        $lst = $this->learningSupportTeamByCriteriaSearcher->__invoke(
            $filters,
            'name',
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0
        );


        $learningSupportTeamEmployees = $this->getEmployeesArray($lst[0]->employees()->toArray());

        return $this->render('backoffice/dashboard/home.html.twig', [
            'job_designations'     => array_count_values(array_column($learningSupportTeamEmployees, 'jobDesignation')),
            'employment_contracts' => array_count_values(array_column($learningSupportTeamEmployees, 'employmentContract')),
            'manager'              => $lst[0]->manager(),
            'schools_assisted'     => $lst[0]->schoolsAssistedByLearningSupportTeam(),
            'employees'            => $lst[0]->employees(),
            'office'               => $lst[0]->officeOfLearningSupport(),
            'shifts_work'          => EmployeeTwigTemplateConstants::SHIFT_WORK_NAMES
        ]);
    }

    private function getEmployeesArray($employees): array
    {

        return array_map(function ($employees) {
            return [
                'jobDesignation'     => $employees->jobDesignation()->name(),
                'employmentContract' => $employees->employmentContract()->name(),
            ];
        }, $employees);
    }
}
