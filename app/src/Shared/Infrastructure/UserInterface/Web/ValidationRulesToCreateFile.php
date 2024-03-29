<?php

namespace App\Shared\Infrastructure\UserInterface\Web;

use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

final class ValidationRulesToCreateFile extends WebController
{
    public function verify(Request $request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection([
            'attachment' => new Assert\Optional([
                new Assert\Type('array'),
                new Assert\All([
                    new Assert\Collection([
                        'file' => [
                            new Assert\File([
                                'maxSize'          => '1024000k',
                                'mimeTypes'        => [
                                    'image/png',
                                    'image/jpeg',
                                    'audio/mp3',
                                    'audio/mpeg',
                                    'application/pdf',
                                    'application/msword',
                                    'application/vnd.ms-excel',
                                    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                                    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                                    'text/plain'
                                ],
                                // TODO:trans
                                'mimeTypesMessage' => 'El archivo seleccionado no esta permitido',
                            ])
                        ]
                    ]),
                ]),
            ]),
        ]);

        $input = $request->files->all();

        return $this->validator->validate($input, $constraint);
    }
}
