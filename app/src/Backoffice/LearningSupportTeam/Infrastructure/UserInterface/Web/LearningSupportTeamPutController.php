<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;
  
  use Symfony\Component\HttpFoundation\RedirectResponse;
  use App\Backoffice\LearningSupportTeam\Application\Put\LearningSupportTeamChangerDetails;
  use App\Shared\Infrastructure\Constant\MessageConstant;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\HttpFoundation\Response;
  
  class LearningSupportTeamPutController extends WebController {
    
    public function __invoke(
      Request $request,
      LearningSupportTeamChangerDetails $updater,
      ValidationRulesToCreateAndUpdate $validationsRules
    ): Response {
      $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'),
        $request->get('csrf_token'));
      
      if (!$isCsrfTokenValid) {
        return $this->redirectWithMessage('error_page',
          MessageConstant::INVALID_TOKEN_CSFR_MESSAGE);
      }
      
      $validationErrors = $validationsRules->verify($request);
      
      return $validationErrors->count() !== 0
        ? $this->redirectWithErrors(TwigTemplateConstants::EDIT_PATH,
          $validationErrors, $request)
        : $this->update($request, $updater);
    }
    
    private function update(
      Request $request,
      LearningSupportTeamChangerDetails $updater
    ): RedirectResponse {
      $updater->__invoke(
        $request->get('id'),
        $request->get('name'),
        $request->get('manager')?:NULL,
        $request->get('office_learning_support_id'),
        $request->get('schools_assisted_by_learning_support_team'),
        $request->get('learning_support_team_category_id')
      );
      
      return $this->redirectWithMessage(
        TwigTemplateConstants::LIST_PATH,
        MessageConstant::SUCCESS_MESSAGE_TO_UPDATE
      );
    }
    
  }
