<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;
	
	use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;
  
  use Symfony\Component\HttpFoundation\Request;
  use Symfony\Component\Validator\Constraints as Assert;
	use Symfony\Component\Validator\ConstraintViolationListInterface;
  use Symfony\Component\Validator\Validator\ValidatorInterface;
  
  
  final class ValidationRulesToCreateAndUpdate
	{
    private ValidatorInterface $validator;
  
    public function __construct(ValidatorInterface $validator)
    {
      $this->validator = $validator;
    }
    
    public function verify( Request $request): ConstraintViolationListInterface
		{
			$constraint = new Assert\Collection(
				[
					'id' => new Assert\Uuid(),
					'name' => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
					'surname' => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
					'identity_card' =>new Assert\AtLeastOneOf([
            new Assert\Blank(),
            new Assert\Length(8)
          ]),
					'phone' => new Assert\AtLeastOneOf([
					    new Assert\Blank(),
					    new Assert\Length(['min' => 6, 'max' => 100])
          ]),
					'email' => [new Assert\Optional(new Assert\Email())],
					'hire_date' => [new Assert\Optional(new Assert\Date())],
					'termination_date' => [new Assert\Optional(new Assert\Date())],
          'address' => new Assert\AtLeastOneOf([
            new Assert\Blank(),
            new Assert\Length(['min' => 2, 'max' => 255])
          ]),
					'job_designation_id' => new Assert\Uuid(),
					'employment_contract_id' => new Assert\Uuid(),
          'shift_work' => new Assert\Choice(EmployeeShitWork::VALID_SHIFTS),
          'learning_support_team' => new Assert\Optional([
            new Assert\All([
              'constraints' => [new Assert\Uuid()],
            ])
          ]),
          'birthday' => [new Assert\Optional(new Assert\Date())],
					'csrf_token' => new Assert\NotBlank()
				]
			);
			
			$input = $request->request->all();
			
			return $this->validator->validate($input, $constraint);
		}
	}