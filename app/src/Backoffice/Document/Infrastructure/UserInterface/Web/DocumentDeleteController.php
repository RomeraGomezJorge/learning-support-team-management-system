<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Document\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\Document\Application\Delete\DocumentDeleter;
	use App\Shared\Infrastructure\Constant\MessageConstant;
	use App\Shared\Infrastructure\Symfony\WebController;
	use App\Shared\Infrastructure\UserInterface\Web\ValidationRulesToDelete;
	use Symfony\Component\HttpFoundation\JsonResponse;
	use Symfony\Component\HttpFoundation\Request;
	
	class DocumentDeleteController extends WebController
	{
		public function __invoke(Request $request, DocumentDeleter $deleter, ValidationRulesToDelete $rulesToDelete): JsonResponse
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
		
		private function delete(DocumentDeleter $deleter, string $id): array
		{
			$deleter->__invoke($id);

            return ['status' => 'success'];
		}
	}
	
