<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;
	
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	
	final class EmploymentContractAddModalContentController extends WebController
	{
		public function __invoke(FormToCreateAnEmploymentContractByAjax $formToCreateAnEmploymentContractByAjax): JsonResponse
		{
			$html = $formToCreateAnEmploymentContractByAjax->__invoke();
			
			return new JsonResponse(['status' => 'success', 'html' => $html]);
		}
	}