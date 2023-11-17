<?php

namespace App\Shared\Infrastructure\Symfony;

use App\Shared\Infrastructure\Constant\MessageConstant;
use App\Shared\Infrastructure\RenderFormInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\ConstraintViolationListInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

abstract class WebController extends AbstractController
{
    protected ValidatorInterface $validator;
    protected TranslatorInterface $translator;

    public function __construct(
        ValidatorInterface $validator,
        TranslatorInterface $translator
    )
    {
        $this->validator = $validator;
        $this->translator = $translator;
    }

    public function redirectWithMessage(
        string $routeName,
        string $message
    ): RedirectResponse
    {
        $this->addFlash('message', $message);

        return $this->redirectToRoute($routeName);
    }

    public function redirectWithErrors(
        string $routeName,
        ConstraintViolationListInterface $errors,
        Request $request
    ): RedirectResponse {
        $this->addFlashFor('hasErrors', [true]);
        $this->addFlashFor('errors', $this->formatFlashErrors($errors));
        $this->addFlashFor('inputs', $request->request->all());

        if ($this->isARouteToCreateAnItem($routeName)) {
            return $this->redirectToRoute($routeName, ['id' => $request->get('id')]);
        }

        return $this->redirectToRoute($routeName);
    }

    public function addFlashFor(
        string $prefix,
        array $messages
    ): void
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

    public function jsonResponseValidationErrors(
        RenderFormInterface $htmlForm,
        ConstraintViolationListInterface $errors,
        Request $request
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

    protected function redirectOnInvalidCsrfToken(): RedirectResponse
    {
        return $this->redirectOnInvalidCsrfToken();
    }

    protected function jsonResponseOnInvalidCsrfToken(): JsonResponse
    {
        return new JsonResponse([
            'status'  => 'fail_invalid_csrf_token',
            'message' => MessageConstant::INVALID_TOKEN_CSFR_MESSAGE
        ]);
    }

    protected function jsonResponseSuccess(): JsonResponse
    {
        return new JsonResponse(['status' => 'success']);
    }

    protected function jsonResponseUnexpectedError(): JsonResponse
    {
        return $this->jsonResponseFail(MessageConstant::UNEXPECTED_ERROR_HAS_OCCURRED);
    }

    protected function jsonResponseFail( string $message): JsonResponse
    {
        return new JsonResponse([
            'status'  => 'fail',
            'message' => $message
        ]);
    }
}
