<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Application\Get\Collection\EmployeeByCriteriaSearcher;
use App\Shared\Infrastructure\Symfony\WebController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class EmployeeSearchController extends WebController
{
    public const SORT_A_LIST_BY_NAME = 'surname';
    public const SORT_A_LIST_ALPHABETICALLY = 'asc';
    public const LIST_BEGIN_ON_0 = 0;
    public const LIST_END_ON_1000 = 1000;

    public function __invoke(
        Request                    $request,
        EmployeeByCriteriaSearcher $employeeByCriteriaSearcher
    ): JsonResponse
    {
        $fullname = $request->get('fullname');

        $filters = [];

        $this->addFullnameFilterIfNotNull($fullname, $filters);

        $this->addIdentityCardFilterIfNotNull($fullname, $filters);

        $employees = $employeeByCriteriaSearcher->__invoke(
            $filters,
            self::SORT_A_LIST_BY_NAME,
            self::SORT_A_LIST_ALPHABETICALLY,
            self::LIST_END_ON_1000,
            self::LIST_BEGIN_ON_0);

        return new JsonResponse(array_map(function ($employees) {
            return [
                'id'            => $employees->id(),
                'name'          => $employees->name(),
                'surname'       => $employees->surname(),
                'identity_card' => $employees->identityCard()
            ];
        }, $employees));
    }

    private function addFullnameFilterIfNotNull(string $fullname, array &$filters): void
    {
        $fullname = explode(' ', $fullname);

        if (!isset($fullname[0])) {
            return;
        }

        if (is_numeric($fullname[0])) {
            return;
        }

        $filters[1]['field']    = 'surname';
        $filters[1]['operator'] = 'CONTAINS';
        $filters[1]['value']    = $fullname[0];

        if (!isset($fullname[1])) {
            return;
        }

        if (is_numeric($fullname[1])) {
            return;
        }

        $filters[0]['field']    = 'name';
        $filters[0]['operator'] = 'CONTAINS';
        $filters[0]['value']    = $fullname[1];
    }

    private function addIdentityCardFilterIfNotNull(string $fullname, array &$filters): void
    {
        $identityCard = preg_replace('/[^0-9]/', '', $fullname);

        if (!is_numeric($identityCard)) {
            return;
        }

        if (!is_null($identityCard)) {
            $filters[2]['field']    = 'identityCard';
            $filters[2]['operator'] = '=';
            $filters[2]['value']    = $identityCard;
        }
    }
}
	