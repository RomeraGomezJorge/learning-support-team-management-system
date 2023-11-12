<?php

namespace App\Shared\Infrastructure\Symfony;


use App\Shared\Infrastructure\RenderFormInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationListInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;


abstract class WebController extends AbstractController
{
    protected ValidatorInterface $validator;

    public function __construct(ValidatorInterface $validator)
    {
        $this->validator = $validator;
    }


    public function redirectWithMessage(string $routeName, string $message): RedirectResponse
    {
        $this->addFlash('message', $message);

        return $this->redirectToRoute($routeName);
    }

    public function redirectWithErrors(
        string                           $routeName,
        ConstraintViolationListInterface $errors,
        Request                          $request
    ): RedirectResponse
    {
        $this->addFlashFor('hasErrors', [true]);
        $this->addFlashFor('errors', $this->formatFlashErrors($errors));
        $this->addFlashFor('inputs', $request->request->all());

        if ($this->isARouteToCreateAnItem($routeName)) {
            return $this->redirectToRoute($routeName, ['id' => $request->get('id')]);
        }

        return $this->redirectToRoute($routeName);
    }

    public function addFlashFor(string $prefix, array $messages): void
    {
        foreach ($messages as $key => $message) {
            $this->addFlash($prefix . '.' . $key, $message);
        }
    }

    public function formatFlashErrors(ConstraintViolationListInterface $violations): array
    {
        $errors = [];
        foreach ($violations as $violation) {
            $errors[str_replace(['[', ']'], ['', ''], $violation->getPropertyPath())] = $violation->getMessage();
        }

        return $errors;
    }

    /**
     * @param string $routeName
     * @return bool
     */
    private function isARouteToCreateAnItem(string $routeName): bool
    {
        return strpos($routeName, "edit") !== false;
    }

    public function jsonResponseWithErrors(
        RenderFormInterface              $htmlForm,
        ConstraintViolationListInterface $errors,
        Request                          $request
    ): JsonResponse
    {
        $this->addFlashFor('hasErrors', [true]);
        $this->addFlashFor('errors', $this->formatFlashErrors($errors));
        $this->addFlashFor('inputs', $request->request->all());

        return new JsonResponse([
            'status'  => 'fail',
            // TODO: trans
            'message' => 'Error al procesar su solicitud',
            'html'    => $htmlForm->__invoke()
        ]);
    }
}
	