<?php

declare(strict_types=1);

namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;

final class TwigTemplateConstants
{
    public const LIST_PATH = 'document_category_list';
    public const EDIT_PATH = 'document_category_edit';
    public const ADD_PATH = 'document_category_add';
    public const CREATE_PATH = 'document_category_create';
    public const UPDATE_PATH = 'document_category_update';
    public const DELETE_PATH = 'document_category_delete';
    public const NAME_AVAILABLE_PATH = 'document_category_name_available';
    public const SECTION_TITLE = 'Document Category';
    public const FORM_FILE_PATH = 'backoffice/documentCategory/formToHandleItem.html.twig';
    public const LIST_FILE_PATH = 'backoffice/documentCategory/list.html.twig';
    public const CREATE_BY_AJAX_PATH = 'document_category_create_by_ajax';
    public const CREATE_BY_AJAX_FILE_PATH = 'backoffice/documentCategory/addDocumentCategoryByModal.html.twig';
    public const ADD_DOCUMENT_CATEGORY_BY_MODAL_PATH = 'document_category_add_by_modal';
}
