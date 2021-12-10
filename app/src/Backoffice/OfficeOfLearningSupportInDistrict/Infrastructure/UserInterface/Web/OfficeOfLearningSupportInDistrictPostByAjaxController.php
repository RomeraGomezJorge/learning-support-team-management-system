<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Post\OfficeOfLearningSupportInDistrictCreator;
	use App\Shared\Infrastructure\Constant\MessageConstant;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	use Symfony\Component\HttpFoundation\Request;
	use Symfony\Component\Validator\Constraints as Assert;
	use Symfony\Component\Validator\ConstraintViolationListInterface;
	use Symfony\Component\Validator\Validation;
	
	class OfficeOfLearningSupportInDistrictPostByAjaxController extends WebController
	{
		public function __invoke(
			Request $request,
			OfficeOfLearningSupportInDistrictCreator $officeOfLearningSupportInDistrictCreator,
			FormToCreateOfficeOfLearningSupportInDistrictByAjax $formToCreateOfficeOfLearningSupportInDistrictByAjax
		): JsonResponse {
			$isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));
			
			if (!$isCsrfTokenValid) {
				return JsonResponse::create(array(
					'status' => 'fail',
					'message' => MessageConstant::INVALID_TOKEN_CSFR_MESSAGE
				));
			}
			
			$validationErrors = $this->validateRequest($request);
			
			return $validationErrors->count() !== 0
				? $this->jsonResponseWithErrors($formToCreateOfficeOfLearningSupportInDistrictByAjax, $validationErrors, $request)
				: $this->createOfficeOfLearningSupportInDistrict($request, $officeOfLearningSupportInDistrictCreator);
		}
		
		private function validateRequest(Request $request): ConstraintViolationListInterface
		{
			$constraint = new Assert\Collection(
				[
					'id' => new Assert\Uuid(),
					'name' => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
					'select_this_office_of_learning_support_in_district_on_save' => [new Assert\Optional()],
					'csrf_token' => [new Assert\NotBlank()]
				]
			);
			
			$input = $request->request->all();
			
			return $this->validator->validate($input, $constraint);
		}
		
		private function createOfficeOfLearningSupportInDistrict(Request $request, OfficeOfLearningSupportInDistrictCreator $officeOfLearningSupportInDistrictCreator): JsonResponse
		{
			$officeOfLearningSupportInDistrictCreator->__invoke(
				$request->get('id'),
				$request->get('name')
			);
			
			return JsonResponse::create(array('status' => 'success'));
		}
	}
