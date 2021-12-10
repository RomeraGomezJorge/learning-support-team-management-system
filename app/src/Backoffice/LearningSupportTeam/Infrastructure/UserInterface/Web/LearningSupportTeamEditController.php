<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\Employee\Infrastructure\UserInterface\Web\TwigTemplateConstants as EmployeeTwigTemplateConstants;
	use App\Backoffice\LearningSupportTeam\Application\Get\Single\LearningSupportTeamFinder;
	use App\Backoffice\OfficeOfLearningSupport\Domain\OfficeOfLearningSupportRepository;
	use App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web\TwigTemplateConstants as SchoolTwigTemplateConstants;
	use App\Shared\Infrastructure\Constant\FormConstant;
	use App\Shared\Infrastructure\RelatedEntities;
	use App\Shared\Infrastructure\Symfony\FlashSession;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\Request;
	use Symfony\Component\HttpFoundation\Response;
	
	class LearningSupportTeamEditController extends WebController
	{
		public function __invoke(
			FlashSession $flashSession,
			Request $request,
			LearningSupportTeamFinder $finder,
			OfficeOfLearningSupportRepository $officeOfLearningSupportRepository,
      RelatedEntities $relatedEntities
		): Response {
			$learningSupportTeam = $finder->__invoke($request->get('id'));
			
			return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
				'page_title' => TwigTemplateConstants::SECTION_TITLE,
				'list_path' => TwigTemplateConstants::LIST_PATH,
				'id' => $learningSupportTeam->id(),
				'name' => $flashSession->get('inputs.name') ?? $learningSupportTeam->name(),
				'manager' => $flashSession->get('inputs.manager') ?? $learningSupportTeam->manager(),
        'learning_support_team_category_id' => $flashSession->get('inputs.learning_support_team_category_id')??$learningSupportTeam->learningSupportTeamCategory()->id(),
        'learning_support_team_categories' => $relatedEntities->learningSupportTeamCategoriesSortedAlphabetically(),
				'office_learning_support_id' => $flashSession->get('inputs.office_learning_support_id') ?? $learningSupportTeam->officeOfLearningSupport()->id(),
				'schools_assisted_by_learning_support_team' => $learningSupportTeam->schoolsAssistedByLearningSupportTeam(),
				'add_school_assisted_by_learning_support_team_add_by_modal' => SchoolTwigTemplateConstants::ADD_SCHOOL_BY_MODAL_PATH,
				'search_school_path' => SchoolTwigTemplateConstants::SEARCH_SCHOOL_PATH,
				'search_employee_path' => EmployeeTwigTemplateConstants::SEARCH_PATH,
				'name_available_path' => TwigTemplateConstants::NAME_AVAILABLE_PATH,
				'offices_learning_support' => $officeOfLearningSupportRepository->getAllSortedAlphabeticallyByDistrict(),
				'form_action_attribute' => TwigTemplateConstants::UPDATE_PATH,
				'submit_button_label' => FormConstant::SUBMIT_BUTTON_VALUE_TO_UPDATE,
				'action_to_do' => FormConstant::UPDATE_LABEL_TEXT,
			]);
		}
	}
