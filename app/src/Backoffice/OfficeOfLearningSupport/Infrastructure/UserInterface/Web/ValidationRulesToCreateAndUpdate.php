<?php

declare(strict_types=1);

namespace App\Backoffice\OfficeOfLearningSupport\Infrastructure\UserInterface\Web;

use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

final class ValidationRulesToCreateAndUpdate extends WebController
{
    public function verify($request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'                                        => new Assert\Uuid(),
                'address'                                   => [new Assert\NotBlank(), new Assert\Length(['max' => 255])],
                'phone'                                     => new Assert\Optional(new Assert\Length(['max' => 100])),
                'office_of_learning_support_in_district_id' => new Assert\Uuid(),
                'csrf_token'                                => new Assert\NotBlank()
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }
}
