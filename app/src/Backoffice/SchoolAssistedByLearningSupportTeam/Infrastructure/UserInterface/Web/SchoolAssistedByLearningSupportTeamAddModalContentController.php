<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web;
	
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	
	final class SchoolAssistedByLearningSupportTeamAddModalContentController extends WebController
	{
		public function __invoke(FormToCreateSchoolAssistedByLearningSupportTeamByAjax  $formToCreateSchoolAssistedByLearningSupportTeamByAjax): JsonResponse
		{
			$html = $formToCreateSchoolAssistedByLearningSupportTeamByAjax->__invoke();
			
			return new JsonResponse(['status' => 'success', 'html' => $html]);
		}
	}