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
return $this->jsonResponseOnInvalidCsrfToken();
            }

            $validationErrors = $rulesToDelete->verify($request);

            $response = $validationErrors->count() !== 0
                ? ['status' => 'fail', 'message' => MessageConstant::UNEXPECTED_ERROR_HAS_OCCURRED]
                : $this->delete($deleter, $request->get('id'));

            return new JsonResponse($response);
        }
		
		private function delete(OfficeOfLearningSupportInDistrictDeleter $deleter, string $id): JsonResponse
        {
            $deleter->__invoke($id);

            return $this->jsonResponseSuccess();
        }
	}
	
