<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;
	
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
          'address' => [ new Assert\NotBlank(), new Assert\Length(['max' => 255])],
          'phone' => new Assert\Optional(new Assert\Length(['max' => 100])),
					'office_of_learning_support_in_district_id' => new Assert\Uuid(),
					'csrf_token' => new Assert\NotBlank()
				]
			);
			
			$input = $request->request->all();
			
			return $this->validator->validate($input, $constraint);
		}
	}