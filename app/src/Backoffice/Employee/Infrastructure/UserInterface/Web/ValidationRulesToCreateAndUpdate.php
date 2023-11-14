<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

final class ValidationRulesToCreateAndUpdate extends WebController
{
    public function verify(Request $request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'                     => [new Assert\Uuid()],
                'name'                   => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
                'surname'                => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
                'identity_card'          => [new Assert\Optional()],
                'phone'                  => [new Assert\AtLeastOneOf([new Assert\Blank(), new Assert\Length(['min' => 6, 'max' => 100])])],
                'email'                  => [new Assert\Optional(new Assert\Email())],
                'hire_date'              => [new Assert\Optional(new Assert\Date())],
                'termination_date'       => [new Assert\Optional(new Assert\Date())],
                'address'                => [new Assert\AtLeastOneOf([new Assert\Blank(), new Assert\Length(['min' => 2, 'max' => 255])])],
                'job_designation_id'     => [new Assert\Uuid()],
                'employment_contract_id' => [new Assert\Uuid()],
                'shift_work'             => [new Assert\Choice(EmployeeShitWork::VALID_SHIFTS)],
                'learning_support_team'  => [new Assert\Optional([new Assert\All(['constraints' => [new Assert\Uuid()],])])],
                'birthday'               => [new Assert\Optional(new Assert\Date())],
                'csrf_token'             => [new Assert\NotBlank()]
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }
}
