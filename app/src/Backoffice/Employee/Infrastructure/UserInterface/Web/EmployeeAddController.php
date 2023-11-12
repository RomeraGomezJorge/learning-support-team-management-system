<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;
	
  
  use App\Shared\Infrastructure\Constant\FormConstant;
	use App\Shared\Infrastructure\RamseyUuidGenerator;
	use App\Shared\Infrastructure\RelatedEntities;
  use App\Shared\Infrastructure\Symfony\FlashSession;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\Response;
	use App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web\TwigTemplateConstants as TeamTwigTemplateConstants;
	
	class EmployeeAddController extends WebController
	{
		public function __invoke(
            FlashSession        $flashSession,
            RamseyUuidGenerator $ramseyUuidGenerator,
            RelatedEntities     $relatedEntities
        ): Response
        {
            return $this->render(TwigTemplateConstants::FORM_FILE_PATH, [
                'list_path'              => TwigTemplateConstants::LIST_PATH,
                'page_title'             => TwigTemplateConstants::SECTION_TITLE,
                'id'                     => $ramseyUuidGenerator->generate(),
                'name'                   => $flashSession->get('inputs.name'),
                'surname'                => $flashSession->get('inputs.surname'),
                'identity_card'          => $flashSession->get('inputs.identity_card'),
                'phone'                  => $flashSession->get('inputs.phone'),
                'email'                  => $flashSession->get('inputs.email'),
                'hire_date'              => $flashSession->get('inputs.hire_date'),
				'termination_date' => $flashSession->get('inputs.termination_date'),
				'address' => $flashSession->get('inputs.address'),
				'job_designation_id' => $flashSession->get('inputs.job_designation_id'),
				'employment_contract_id' => $flashSession->get('inputs.employment_contract_id'),
				'shift_work' => $flashSession->get('inputs.shift_work'),
				'learning_support_team' => $flashSession->get('inputs.learning_support_team'),
				'birthday' => $flashSession->get('inputs.birthday'),
				'job_designations' => $relatedEntities->jobDesignationsSortedAlphabetically(),
				'employment_contracts' => $relatedEntities->employmentContractsSortedAlphabetically(),
				'documents' => null,
				'shifts_work' => TwigTemplateConstants::SHIFT_WORK_NAMES,
				'search_learning_support_team_path' => TeamTwigTemplateConstants::SEARCH_PATH,
				'form_action_attribute' => TwigTemplateConstants::CREATE_PATH,
				'submit_button_label' => FormConstant::SUBMIT_BUTTON_VALUE_TO_CREATE,
				'action_to_do' => FormConstant::CREATE_LABEL_TEXT,
			]);
		}
	}
