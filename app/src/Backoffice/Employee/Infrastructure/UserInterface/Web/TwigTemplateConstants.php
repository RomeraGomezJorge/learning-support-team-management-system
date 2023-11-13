<?php

declare(strict_types=1);

namespace App\Backoffice\Employee\Infrastructure\UserInterface\Web;

use App\Backoffice\Employee\Domain\ValueObject\EmployeeShitWork;

final class TwigTemplateConstants
{
    public const LIST_PATH = 'employee_list';
    public const EDIT_PATH = 'employee_edit';
    public const ADD_PATH = 'employee_add';
    public const CREATE_PATH = 'employee_create';
    public const UPDATE_PATH = 'employee_update';
    public const DELETE_PATH = 'employee_delete';
    public const NAME_AVAILABLE_PATH = 'employee_name_available';
    public const SEARCH_PATH = 'employee_search';
    public const SECTION_TITLE = 'Employee';
    public const FORM_FILE_PATH = 'backoffice/employee/formToHandleItem.html.twig';
    public const LIST_FILE_PATH = 'backoffice/employee/list.html.twig';
    public const CREATE_BY_AJAX_PATH = 'employee_create_by_ajax';
    public const CREATE_BY_AJAX_FILE_PATH = 'backoffice/employee/addEmployeeByModal.html.twig';
    public const ADD_EMPLOYEE_BY_MODAL_PATH = 'employee_add_by_modal';
    public const SHIFT_WORK_NAMES = [
        EmployeeShitWork::MORNING               => 'Morning',
        EmployeeShitWork::AFTERNOON             => 'Afternoon',
        EmployeeShitWork::MORNING_AND_AFTERNOON => 'Morning And Afternoon',
        EmployeeShitWork::UNKNOWN               => 'Unknown',
    ];
}
