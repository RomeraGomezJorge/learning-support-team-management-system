<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;
	
	use Symfony\Component\HttpFoundation\RedirectResponse;
	use App\Backoffice\OfficeOfLearningSupport\Application\Put\OfficeOfLearningSupportChangerDetails;
	use App\Shared\Infrastructure\Constant\MessageConstant;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\Request;
	use Symfony\Component\HttpFoundation\Response;
	
	class OfficeOfLearningSupportPutController extends WebController
	{
		public function __invoke(
		  Request $request,
      OfficeOfLearningSupportChangerDetails $updater,
      ValidationRulesToCreateAndUpdate $validationRules
  ): Response
		{
			$isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));
			
			if (!$isCsrfTokenValid) {
				return $this->redirectWithMessage('error_page', MessageConstant::INVALID_TOKEN_CSFR_MESSAGE);
			}
			
			$validationErrors = $validationRules->verify($request);
			
			return $validationErrors->count() !== 0
				? $this->redirectWithErrors(TwigTemplateConstants::EDIT_PATH, $validationErrors, $request)
				: $this->update($request, $updater);
		}
		
		private function update(Request $request, OfficeOfLearningSupportChangerDetails $updater): RedirectResponse
		{
			$updater->__invoke(
			  $request->get('id'),
        $request->get('address'),
        $request->get('phone'),
        $request->get('office_of_learning_support_in_district_id'),
        );
			
			return $this->redirectWithMessage(
				TwigTemplateConstants::LIST_PATH,
				MessageConstant::SUCCESS_MESSAGE_TO_UPDATE
			);
		}
	}
