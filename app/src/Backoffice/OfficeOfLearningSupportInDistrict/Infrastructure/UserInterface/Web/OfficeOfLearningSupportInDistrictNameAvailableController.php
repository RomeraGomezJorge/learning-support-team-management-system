<?php
	
	declare(strict_types=1);
	
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\OfficeOfLearningSupportInDistrict\Application\Get\Single\CheckOfficeOfLearningSupportInDistrictNameAvailability;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	use Symfony\Component\HttpFoundation\Request;
	
	final class OfficeOfLearningSupportInDistrictNameAvailableController extends WebController
	{
		public function __invoke(
			Request $request,
			CheckOfficeOfLearningSupportInDistrictNameAvailability $checkOfficeOfLearningSupportInDistrictNameAvailability
		): JsonResponse {
			return new JsonResponse(
				$checkOfficeOfLearningSupportInDistrictNameAvailability->__invoke($request->get('name', ''))
			);
		}
	}