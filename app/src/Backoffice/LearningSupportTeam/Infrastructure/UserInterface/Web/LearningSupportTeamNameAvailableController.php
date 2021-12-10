<?php
	
	declare(strict_types=1);
	
	
	namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\LearningSupportTeam\Application\Get\Single\CheckLearningSupportTeamNameAvailability;
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	use Symfony\Component\HttpFoundation\Request;
	
	final class LearningSupportTeamNameAvailableController extends WebController
	{
		public function __invoke(
			Request $request,
			CheckLearningSupportTeamNameAvailability $checkLearningSupportTeamNameAvailability
		): JsonResponse {
			return new JsonResponse(
				$checkLearningSupportTeamNameAvailability->__invoke($request->get('name', ''))
			);
		}
	}