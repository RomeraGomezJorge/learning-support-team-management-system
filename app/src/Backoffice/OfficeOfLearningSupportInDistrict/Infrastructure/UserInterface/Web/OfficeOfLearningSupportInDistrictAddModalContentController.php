<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web;
	
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	
	final class OfficeOfLearningSupportInDistrictAddModalContentController extends WebController
	{
		public function __invoke(FormToCreateOfficeOfLearningSupportInDistrictByAjax $formToCreateOfficeOfLearningSupportInDistrictByAjax): JsonResponse
		{
			$html = $formToCreateOfficeOfLearningSupportInDistrictByAjax->__invoke();
			
			return new JsonResponse(array('status' => 'success', 'html' => $html));
		}
	}