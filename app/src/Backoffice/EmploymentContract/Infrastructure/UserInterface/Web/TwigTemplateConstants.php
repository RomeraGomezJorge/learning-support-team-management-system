<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\EmploymentContract\Infrastructure\UserInterface\Web;
	
	final class TwigTemplateConstants
	{
		const LIST_PATH = 'employment_contract_list';
		const EDIT_PATH = 'employment_contract_edit';
		const ADD_PATH = 'employment_contract_add';
		const CREATE_PATH = 'employment_contract_create';
		const UPDATE_PATH = 'employment_contract_update';
		const DELETE_PATH = 'employment_contract_delete';
		const FULLNAME_AVAILABLE_PATH = 'employment_contract_name_available';
		const SECTION_TITLE = 'Employment Contract';
		const FORM_FILE_PATH = 'backoffice/employmentContract/formToHandleItem.html.twig';
		const LIST_FILE_PATH = 'backoffice/employmentContract/list.html.twig';
		const CREATE_BY_AJAX_PATH = 'employment_contract_create_by_ajax';
		const ADD_EMPLOYMENT_CONTRACT_BY_MODAL_PATH = 'employment_contract_add_by_modal';
	}