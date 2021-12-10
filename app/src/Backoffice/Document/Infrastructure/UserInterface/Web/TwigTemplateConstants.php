<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\Document\Infrastructure\UserInterface\Web;
  
  final class TwigTemplateConstants {
    
    const LIST_PATH = 'document_list';
    
    const EDIT_PATH = 'document_edit';
    
    const ADD_PATH = 'document_add';
    
    const CREATE_PATH = 'document_create';
    
    const UPDATE_PATH = 'document_update';
    
    const DELETE_PATH = 'document_delete';
    
    const SECTION_TITLE = 'Document';
    
    const FORM_FILE_PATH = 'backoffice/document/formToHandleItem.html.twig';
    
    const LIST_FILE_PATH = 'backoffice/document/list.html.twig';
    
    const ALLOWED_FILES = 'image/png,image/x-png,image/jpeg,image/jpg,application/msword,application/vnd.ms-excel,application/vnd.ms-powerpoint,text/plain,application/pdf,.xls,.xlsx,.xlsm';
    
    const ATTACHMENT_DELETE_PATH = 'document_attachment_delete';
    
    const ATTACHMENT_DELETE_MODAL_CONFIRMATION_PATH = 'document_attachment_delete_confirmation_modal';
    
  }