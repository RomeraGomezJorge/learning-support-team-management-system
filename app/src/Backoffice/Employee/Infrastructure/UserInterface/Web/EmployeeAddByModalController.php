<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;
  
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\JsonResponse;
  
  final class EmployeeAddByModalController extends WebController {
    
    public function __invoke(
      FormToCreateEmployeeByAjax $formToCreateEmployeeByAjax
    ): JsonResponse {
      $html = $formToCreateEmployeeByAjax->__invoke();
      
      return new JsonResponse(['status' => 'success', 'html' => $html]);
    }
    
  }
    
  