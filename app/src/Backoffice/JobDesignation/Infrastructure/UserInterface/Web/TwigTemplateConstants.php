<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\JobDesignation\Infrastructure\UserInterface\Web;
	
	final class TwigTemplateConstants
	{
		const LIST_PATH = 'job_designation_list';
		const EDIT_PATH = 'job_designation_edit';
		const ADD_PATH = 'job_designation_add';
		const CREATE_PATH = 'job_designation_create';
		const UPDATE_PATH = 'job_designation_update';
		const DELETE_PATH = 'job_designation_delete';
		const NAME_AVAILABLE_PATH = 'job_designation_name_available';
		const SECTION_TITLE = 'Job Designation';
		const FORM_FILE_PATH = 'backoffice/jobDesignation/formToHandleItem.html.twig';
		const LIST_FILE_PATH = 'backoffice/jobDesignation/list.html.twig';
		const CREATE_BY_AJAX_PATH = 'job_designation_create_by_ajax';
		const CREATE_BY_AJAX_FILE_PATH = 'backoffice/jobDesignation/addJobDesignationByModal.html.twig';
		const ADD_EMPLOYMENT_CONTRACT_BY_MODAL_PATH = 'job_designation_add_by_modal';
	}