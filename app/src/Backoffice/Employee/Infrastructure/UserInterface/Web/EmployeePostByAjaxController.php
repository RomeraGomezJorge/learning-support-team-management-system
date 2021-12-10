<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;
  
  use App\Backoffice\Employee\Application\Post\EmployeeCreator;
  use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;
  use App\Shared\Infrastructure\Constant\MessageConstant;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\JsonResponse;
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\Validator\Constraints as Assert;
  use Symfony\Component\Validator\ConstraintViolationListInterface;
  use Symfony\Component\Validator\Validator\ValidatorInterface;
  
  
  class EmployeePostByAjaxController extends WebController {
    
    public function __construct() {
    }
    
    public function __invoke(
      Request $request,
      EmployeeCreator $creator,
      FormToCreateEmployeeByAjax $formToCreateByAjax,
      ValidatorInterface $validator
    ): JsonResponse {
      $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'),
        $request->get('csrf_token'));
      
      if (!$isCsrfTokenValid) {
        return $this->json([
          'status' => 'fail',
          'message' => MessageConstant::INVALID_TOKEN_CSFR_MESSAGE,
        ]);
      }
      
      $errors = $this->validateRequest($request, $validator);
      
      return $errors->count() !== 0
        ? $this->jsonResponseWithErrors($formToCreateByAjax, $errors, $request)
        : $this->create($request, $creator);
    }
    
    private function validateRequest(
      Request $request,
      ValidatorInterface $validator
    ): ConstraintViolationListInterface {
      $constraint = new Assert\Collection(
        [
          'id' => new Assert\Uuid(),
          'name' => [
            new Assert\NotBlank(),
            new Assert\Length(['min' => 3, 'max' => 100]),
          ],
          'surname' => [
            new Assert\NotBlank(),
            new Assert\Length(['min' => 3, 'max' => 100]),
          ],
          'identity_card' => new Assert\AtLeastOneOf([
            new Assert\Blank(),
            new Assert\Length(8),
          ]),
          'job_designation_id' => new Assert\Uuid(),
          'employment_contract_id' => new Assert\Uuid(),
          'shift_work' => new Assert\Choice(EmployeeShitWork::VALID_SHIFTS),
          'learning_support_team' => new Assert\Optional([
            new Assert\All([
              'constraints' => [new Assert\Uuid()],
            ]),
          ]),
          'csrf_token' => new Assert\NotBlank(),
          'select_this_employee_on_save' => [new Assert\Optional()],
        
        ]
      );
      
      $input = $request->request->all();
      
      return $validator->validate($input, $constraint);
    }
    
    private function create(
      Request $request,
      EmployeeCreator $creator
    ): JsonResponse {
      $creator->__invoke(
        $request->get('id'),
        $request->get('name'),
        $request->get('surname'),
        $request->get('identity_card') ?: NULL,
        $request->get('phone') ?: NULL,
        $request->get('email') ?: NULL,
        $request->get('hire_date') ?: NULL,
        $request->get('termination_date') ?: NULL,
        $request->get('address') ?: NULL,
        $request->get('job_designation_id'),
        $request->get('employment_contract_id'),
        $request->get('shift_work'),
        $request->get('learning_support_team'),
        $request->get('birthday') ?: NULL
      );
      
      
      return $this->json(['status' => 'success']);
    }
    
  }
