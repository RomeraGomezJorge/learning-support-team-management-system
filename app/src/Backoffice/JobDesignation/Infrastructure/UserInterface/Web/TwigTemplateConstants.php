<?php

declare(strict_types=1);

namespace App\Backoffice\JobDesignation\Infrastructure\UserInterface\Web;

final class TwigTemplateConstants
{
    public const LIST_PATH = 'job_designation_list';
    public const EDIT_PATH = 'job_designation_edit';
    public const ADD_PATH = 'job_designation_add';
    public const CREATE_PATH = 'job_designation_create';
    public const UPDATE_PATH = 'job_designation_update';
    public const DELETE_PATH = 'job_designation_delete';
    public const NAME_AVAILABLE_PATH = 'job_designation_name_available';
    public const SECTION_TITLE = 'Job Designation';
    public const FORM_FILE_PATH = 'backoffice/jobDesignation/formToHandleItem.html.twig';
    public const LIST_FILE_PATH = 'backoffice/jobDesignation/list.html.twig';
    public const CREATE_BY_AJAX_PATH = 'job_designation_create_by_ajax';
    public const CREATE_BY_AJAX_FILE_PATH = 'backoffice/jobDesignation/addJobDesignationByModal.html.twig';
    public const ADD_EMPLOYMENT_CONTRACT_BY_MODAL_PATH = 'job_designation_add_by_modal';
}
