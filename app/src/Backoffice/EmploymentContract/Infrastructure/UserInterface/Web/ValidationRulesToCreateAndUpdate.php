<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;

use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

final class ValidationRulesToCreateAndUpdate extends WebController
{
    public function verify($request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'         => new Assert\Uuid(),
                'name'       => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
                'csrf_token' => new Assert\NotBlank()
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }
}
