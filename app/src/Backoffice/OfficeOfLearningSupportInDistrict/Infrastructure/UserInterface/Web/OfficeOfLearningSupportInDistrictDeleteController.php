<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Delete\OfficeOfLearningSupportInDistrictDeleter;
	use App\Shared\Infrastructure\Constant\MessageConstant;
	use App\Shared\Infrastructure\Symfony\WebController;
	use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
	use Symfony\Component\HttpFoundation\JsonResponse;
	use Symfony\Component\HttpFoundation\Request;
	
	class OfficeOfLearningSupportInDistrictDeleteController extends WebController
	{
		public function __invoke(Request $request, OfficeOfLearningSupportInDistrictDeleter $deleter, ValidationRulesToDelete $rulesToDelete): JsonResponse
		{
			$isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));
			
			if (!$isCsrfTokenValid) {
				return new JsonResponse(array(
					'status' => 'fail_invalid_csfr_token',
					'message' => MessageConstant::INVALID_TOKEN_CSFR_MESSAGE
				));
			}
			
			$validationErrors = $rulesToDelete->verify($request);
			
			$response = $validationErrors->count() !== 0 ?
				array('status' => 'fail', 'message' => MessageConstant::UNEXPECTED_ERROR_HAS_OCCURRED) :
				$this->delete($deleter, $request->get('id'));
			
			return new JsonResponse($response);
		}
		
		private function delete(OfficeOfLearningSupportInDistrictDeleter $deleter, string $id): array
		{
			$deleter->__invoke($id);
			
			return array('status' => 'success');
		}
	}
	
