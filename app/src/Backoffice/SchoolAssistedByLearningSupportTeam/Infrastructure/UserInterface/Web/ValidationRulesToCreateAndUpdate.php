<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web;
	
	use Symfony\Component\Validator\Constraints as Assert;
	use Symfony\Component\Validator\ConstraintViolationListInterface;
  use Symfony\Component\Validator\Validator\ValidatorInterface;
  
  final class ValidationRulesToCreateAndUpdate
	{

    private ValidatorInterface $validator;
  
    public function __construct(ValidatorInterface $validator) {
      $this->validator = $validator;
    }
    
    public function verify($request): ConstraintViolationListInterface
		{
			$constraint = new Assert\Collection(
				[
					'id' => new Assert\Uuid(),
          'name' => new Assert\Optional(new Assert\Length(['max' => 255])),
          'number' => new Assert\Optional(new Assert\Positive()),
					'csrf_token' => new Assert\NotBlank()
				]
			);
			//TODO: use new Assert\Callback($callback) to validate at least one of values(Nane and number) is not empty
			$input = $request->request->all();
			
			return $this->validator->validate($input, $constraint);
		}
	}