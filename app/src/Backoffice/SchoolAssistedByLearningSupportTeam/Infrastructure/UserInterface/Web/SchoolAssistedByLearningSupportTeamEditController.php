<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web;
  
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Single\SchoolAssistedByLearningSupportTeamFinder;
  use App\Shared\Infrastructure\Constant\FormConstant;
  use App\Shared\Infrastructure\Symfony\FlashSession;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\HttpFoundation\Response;
  
  class SchoolAssistedByLearningSupportTeamEditController extends WebController {
    
    public function __invoke(
        FlashSession                              $flashSession,
        Request                                   $request,
        SchoolAssistedByLearningSupportTeamFinder $finder
    ): Response
    {
        $schoolsAssistedByLearningSupportTeam = $finder->__invoke($request->get('id'));

        return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
            'page_title'            => TwigTemplateConstants::SECTION_TITLE,
            'list_path'             => TwigTemplateConstants::LIST_PATH,
            'id'                    => $schoolsAssistedByLearningSupportTeam->id(),
            'name'                  => $flashSession->get('inputs.name') ?? $schoolsAssistedByLearningSupportTeam->name(),
            'number'                => $flashSession->get('inputs.number') ?? $schoolsAssistedByLearningSupportTeam->number(),
            'form_action_attribute' => TwigTemplateConstants::UPDATE_PATH,
            'submit_button_label'   => FormConstant::SUBMIT_BUTTON_VALUE_TO_UPDATE,
        'action_to_do' => FormConstant::UPDATE_LABEL_TEXT,
      ]);
    }
    
  }
