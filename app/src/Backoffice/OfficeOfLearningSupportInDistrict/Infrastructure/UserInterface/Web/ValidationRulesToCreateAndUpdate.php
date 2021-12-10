<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\OfficeOfLearningSupportInDistrict\Infrastructure\UserInterface\Web;
	
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
					'name' => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
					'csrf_token' => new Assert\NotBlank()
				]
			);
			
			$input = $request->request->all();
			
			return $this->validator->validate($input, $constraint);
		}
	}