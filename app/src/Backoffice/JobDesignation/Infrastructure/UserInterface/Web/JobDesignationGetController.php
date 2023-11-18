<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Infrastructure\UserInterface\Web;

use App\Backoffice\JobDesignation\Application\Get\Collection\JobDesignationByCriteriaCounter;
use App\Backoffice\JobDesignation\Application\Get\Collection\JobDesignationByCriteriaSearcher;
use App\Shared\Infrastructure\Symfony\WebController;
use App\Shared\Infrastructure\UserInterface\Web\TwigTemplateGlobalConstants;
use App\Shared\Infrastructure\Utils\FilterUtil;
use App\Shared\Infrastructure\Utils\NextPageUtil;
use App\Shared\Infrastructure\Utils\OffsetPaginationUtil;
use App\Shared\Infrastructure\Utils\PreviousPageUtil;
use App\Shared\Infrastructure\Utils\SortUtil;
use App\Shared\Infrastructure\Utils\TotalNumberOfPagesUtil;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class JobDesignationGetController extends WebController
{
    public function __invoke(
        Request $request,
        JobDesignationByCriteriaSearcher $itemsByCriteriaSearcher,
        JobDesignationByCriteriaCounter $counter
    ): Response {
        $orderBy = $request->get('orderBy');

        $order = $request->get('order');

        $page = (int)$request->get('page');

        $limit = (int)$request->get('limit');

        $filters = FilterUtil::getFiltersOrEmpyArray($request->get('filters'));

        $jobDesignations = $itemsByCriteriaSearcher->__invoke(
            $filters,
            $order,
            $orderBy,
            $limit,
            OffsetPaginationUtil::calculate($limit, $page)
        );

        $totalItem = $counter->__invoke(
            $filters,
            $order,
            $orderBy,
            $limit,
            OffsetPaginationUtil::calculate($limit, $page)
        );

        $totalNumberOfPages = TotalNumberOfPagesUtil::calculate($page, $limit, $totalItem);

        return $this->render(TwigTemplateConstants::LIST_FILE_PATH, [
            'page_title'                     => TwigTemplateConstants::SECTION_TITLE,
            'list_path'                      => TwigTemplateConstants::LIST_PATH,
            'edit_path'                      => TwigTemplateConstants::EDIT_PATH,
            'add_path'                       => TwigTemplateConstants::ADD_PATH,
            'delete_path'                    => TwigTemplateConstants::DELETE_PATH,
            'delete_confirmation_modal_path' => TwigTemplateGlobalConstants::DELETE_CONFIRMATION_MODAL_PATH,
            'orderBy'                        => $orderBy,
            'order'                          => $order,
            'limit'                          => $limit,
            'filters'                        => $request->get('filters'),
            'toggleSort'                     => SortUtil::toggle($orderBy),
            'currentPage'                    => $page,
            'nextPage'                       => NextPageUtil::calculate($page, $totalNumberOfPages),
            'previousPage'                   => PreviousPageUtil::calculate($page),
            'totalPage'                      => $totalNumberOfPages,
            'totalItem'                      => $totalItem,
            'jobDesignations'                => $jobDesignations
        ]);
    }
}
