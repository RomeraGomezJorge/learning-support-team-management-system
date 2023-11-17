<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Infrastructure\UserInterface\Web;

use App\Backoffice\JobDesignation\Application\Post\JobDesignationCreator;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

class JobDesignationPostByAjaxController extends WebController
{
    public function __invoke(
        Request $request,
        JobDesignationCreator $jobDesignationCreator,
        FormToCreateAJobDesignationByAjax $formToCreateJobDesignationByAjax
    ): JsonResponse {
        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        $validationErrors = $this->validateRequest($request);

        return ($validationErrors->count() !== 0)
            ? $this->jsonResponseValidationErrors($formToCreateJobDesignationByAjax, $validationErrors, $request)
            : $this->createJobDesignation($request, $jobDesignationCreator);
    }

    private function validateRequest(Request $request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'                                  => [new Assert\Uuid()],
                'name'                                => [new Assert\NotBlank(), new Assert\Length(['min' => 3, 'max' => 100])],
                'select_this_job_designation_on_save' => [new Assert\Optional()],
                'csrf_token'                          => [new Assert\NotBlank()]
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }

    private function createJobDesignation(Request $request, JobDesignationCreator $jobDesignationCreator): JsonResponse
    {
        $jobDesignationCreator->__invoke(
            $request->get('id'),
            $request->get('name')
        );

        return $this->jsonResponseSuccess();
    }
}
