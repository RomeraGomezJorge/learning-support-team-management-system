<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;
	
	final class TwigTemplateConstants
	{
		const LIST_PATH = 'document_category_list';
		const EDIT_PATH = 'document_category_edit';
		const ADD_PATH = 'document_category_add';
		const CREATE_PATH = 'document_category_create';
		const UPDATE_PATH = 'document_category_update';
		const DELETE_PATH = 'document_category_delete';
		const NAME_AVAILABLE_PATH = 'document_category_name_available';
		const SECTION_TITLE = 'Document Category';
		const FORM_FILE_PATH = 'backoffice/documentCategory/formToHandleItem.html.twig';
		const LIST_FILE_PATH = 'backoffice/documentCategory/list.html.twig';
		const CREATE_BY_AJAX_PATH = 'document_category_create_by_ajax';
		const CREATE_BY_AJAX_FILE_PATH = 'backoffice/documentCategory/addDocumentCategoryByModal.html.twig';
		const ADD_DOCUMENT_CATEGORY_BY_MODAL_PATH = 'document_category_add_by_modal';
	}