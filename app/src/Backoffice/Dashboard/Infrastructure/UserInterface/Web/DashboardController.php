<?php
  
  namespace App\Backoffice\Dashboard\Infrastructure\UserInterface\Web;
  
  use App\Backoffice\LearningSupportTeam\Application\Get\Collection\LearningSupportTeamByCriteriaSearcher;
  use App\Backoffice\LearningSupportTeam\Domain\LearningSupportTeam;
  use App\Backoffice\LearningSupportTeamCategory\Application\Get\Collection\LearningSupportTeamCategoryByCriteriaSearcher;
  use App\Backoffice\OfficeOfLearningSupport\Application\Get\Collection\OfficeOfLearningSupportByCriteriaSearcher;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\HttpFoundation\Response;
  
  class DashboardController extends WebController {
    
    public function __invoke(
        Request                                       $request,
        LearningSupportTeamCategoryByCriteriaSearcher $learningSupportTeamCategoryByCriteriaSearcher,
        OfficeOfLearningSupportByCriteriaSearcher     $OfficeOfLearningSupportByCriteriaSearcher
    ): Response
    {

        return $this->render('backoffice/dashboard/index.html.twig', [
            'learning_support_team_categories' => $learningSupportTeamCategoryByCriteriaSearcher->__invoke([], NULL, NULL, NULL, NULL),
            'office_of_learning_support_team'  => $OfficeOfLearningSupportByCriteriaSearcher->__invoke([], NULL, NULL, NULL, NULL)
        ]);
    }
    
  }
