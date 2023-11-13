<?php

declare(strict_types=1);

namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;

final class TwigTemplateConstants
{
    public const LIST_PATH = 'employment_contract_list';
    public const EDIT_PATH = 'employment_contract_edit';
    public const ADD_PATH = 'employment_contract_add';
    public const CREATE_PATH = 'employment_contract_create';
    public const UPDATE_PATH = 'employment_contract_update';
    public const DELETE_PATH = 'employment_contract_delete';
    public const FULLNAME_AVAILABLE_PATH = 'employment_contract_name_available';
    public const SECTION_TITLE = 'Employment Contract';
    public const FORM_FILE_PATH = 'backoffice/employmentContract/formToHandleItem.html.twig';
    public const LIST_FILE_PATH = 'backoffice/employmentContract/list.html.twig';
    public const CREATE_BY_AJAX_PATH = 'employment_contract_create_by_ajax';
    public const ADD_EMPLOYMENT_CONTRACT_BY_MODAL_PATH = 'employment_contract_add_by_modal';
}
