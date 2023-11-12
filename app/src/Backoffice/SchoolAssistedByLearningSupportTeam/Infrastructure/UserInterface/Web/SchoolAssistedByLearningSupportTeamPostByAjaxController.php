<?php

declare(strict_types=1);

namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web;

use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Post\SchoolAssistedByLearningSupportTeamCreator;
use App\Shared\Infrastructure\Constant\MessageConstant;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ConstraintViolationListInterface;

class SchoolAssistedByLearningSupportTeamPostByAjaxController extends WebController
{
    public function __invoke(
        Request                                               $request,
        SchoolAssistedByLearningSupportTeamCreator            $schoolsAssistedByLearningSupportTeamCreator,
        FormToCreateSchoolAssistedByLearningSupportTeamByAjax $formToCreateSchoolAssistedByLearningSupportTeamByAjax
    ): JsonResponse
    {

        $isCsrfTokenValid = $this->isCsrfTokenValid($request->get('id'), $request->get('csrf_token'));

        if (!$isCsrfTokenValid) {
            return $this->jsonResponseOnInvalidCsrfToken();
        }

        var_dump($isCsrfTokenValid);

        die();

        $validationErrors = $this->validateRequest($request);

        return $validationErrors->count() !== 0
            ? $this->jsonResponseWithErrors($formToCreateSchoolAssistedByLearningSupportTeamByAjax, $validationErrors, $request)
            : $this->createSchoolAssistedByLearningSupportTeam($request, $schoolsAssistedByLearningSupportTeamCreator);
    }

    private function validateRequest(Request $request): ConstraintViolationListInterface
    {
        $constraint = new Assert\Collection(
            [
                'id'                                                           => [new Assert\Uuid()],
                'name'                                                         => [new Assert\Optional(new Assert\Length(['max' => 255]))],
                'number'                                                       => [new Assert\Optional(new Assert\Positive())],
                'select_this_school_assisted_by_learning_support_team_on_save' => [new Assert\Optional()],
                'csrf_token'                                                   => [new Assert\NotBlank()]
            ]
        );

        $input = $request->request->all();

        return $this->validator->validate($input, $constraint);
    }

    private function createSchoolAssistedByLearningSupportTeam(Request $request, SchoolAssistedByLearningSupportTeamCreator $schoolsAssistedByLearningSupportTeamCreator): JsonResponse
    {
        $schoolsAssistedByLearningSupportTeamCreator->__invoke(
            $request->get('id'),
            $request->get('name'),
            $request->get('number')
        );

        return $this->jsonResponseSuccess();
    }
}
