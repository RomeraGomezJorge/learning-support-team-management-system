<?php

  declare(strict_types=1);

namespace App\Backoffice\Document\Infrastructure\UserInterface\Web;

  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\Validator\Constraints as Assert;
  use Symfony\Component\Validator\ConstraintViolationListInterface;

final class ValidationRulesToCreateAndUpdate extends WebController
{
    public function verify($request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'                   => new Assert\Uuid(),
                'name'                 => [new Assert\NotBlank(), new Assert\Length(['max' => 255])],
                'number'               => new Assert\Optional(new Assert\Length(['max' => 100])),
                'document_category_id' => new Assert\Uuid(),
                'attachment'           => new Assert\Optional([
                    new Assert\Type('array'),
                    new Assert\All([
                        new Assert\Collection([
                            'description' => new Assert\Optional(new Assert\Length(['max' => 100])),
                            'file'        => new Assert\Optional(new Assert\File()),
                        ]),
                    ]),
                ]),
                'employees'            => new Assert\Optional([
                    new Assert\Type('array'),
                    new Assert\All([
                        'constraints' => [new Assert\Uuid()],
                    ]),
                ]),
                'csrf_token'           => new Assert\NotBlank(),
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }
}
