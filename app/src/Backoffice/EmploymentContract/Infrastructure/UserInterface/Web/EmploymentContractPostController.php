<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\EmploymentContract\Application\Post\EmploymentContractCreator;
	use App\Shared\Infrastructure\Constant\MessageConstant;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\RedirectResponse;
	use Symfony\Component\HttpFoundation\Request;
	use Symfony\Component\HttpFoundation\Response;
	
	class EmploymentContractPostController extends WebController
	{
		public function __invoke(
		  Request $request,
      EmploymentContractCreator $creator,
      ValidationRulesToCreateAndUpdate $validationRules
  ): Response
		{
			$isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));
			
			if (!$isCsrfTokenValid) {
				return $this->redirectOnInvalidCsrfToken();
			}
			
			$validationErrors = $validationRules->verify($request);
			
			return $validationErrors->count() !== 0
				? $this->redirectWithErrors(TwigTemplateConstants::CREATE_PATH, $validationErrors, $request)
				: $this->create($request, $creator);
		}
		
		private function create(Request $request, EmploymentContractCreator $creator): RedirectResponse
		{
			$creator->__invoke($request->get('id'),$request->get('name'));
			
			return $this->redirectWithMessage(
				TwigTemplateConstants::LIST_PATH,
				MessageConstant::SUCCESS_MESSAGE_TO_CREATE
			);
		}
	}
