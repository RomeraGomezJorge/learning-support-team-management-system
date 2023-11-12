<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;
	
	use App\Shared\Infrastructure\Symfony\WebController;
	use Symfony\Component\HttpFoundation\JsonResponse;
	
	final class DocumentCategoryAddModalContentController extends WebController
	{
		public function __invoke(FormToCreateADocumentCategoryByAjax $formToCreateDocumentCategoryByAjax): JsonResponse
		{
			$html = $formToCreateDocumentCategoryByAjax->__invoke();
			
			return new JsonResponse(['status' => 'success', 'html' => $html]);
		}
	}