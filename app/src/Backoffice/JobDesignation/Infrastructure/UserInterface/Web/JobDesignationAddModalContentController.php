<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Infrastructure\UserInterface\Web;

use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;

final class JobDesignationAddModalContentController extends WebController
{
    public function __invoke(FormToCreateAJobDesignationByAjax $formToCreateJobDesignationByAjax): JsonResponse
    {
        $html = $formToCreateJobDesignationByAjax->__invoke();

        return new JsonResponse(['status' => 'success', 'html' => $html]);
    }
}
