<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web;
	
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
		
		public function verify($request): ConstraintViolationListInterface
		{
			$constraint = new Assert\Collection(
				[
					'id' => new Assert\Uuid(),
					'name' => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
					'manager' => new Assert\Optional([new Assert\Uuid()]),
					'schools_assisted_by_learning_support_team' => new Assert\Optional(),
					'office_learning_support_id' => new Assert\Uuid(),
					'learning_support_team_category_id' => new Assert\Uuid(),
					'csrf_token' => new Assert\NotBlank()
				]
			);
			
			$input = $request->request->all();
			
			return $this->validator->validate($input, $constraint);
		}
	}