<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeam\Infrastructure\UserInterface\Web ;
	
	final class TwigTemplateConstants
	{
		const LIST_PATH = 'learning_support_team_list';
		const EDIT_PATH = 'learning_support_team_edit';
		const ADD_PATH = 'learning_support_team_add';
		const CREATE_PATH = 'learning_support_team_create';
		const UPDATE_PATH = 'learning_support_team_update';
		const DELETE_PATH = 'learning_support_team_delete';
		const SEARCH_PATH = 'learning_support_team_search';
		const NAME_AVAILABLE_PATH = 'learning_support_team_name_available';
		const SECTION_TITLE = 'Learning Support Team';
		const FORM_FILE_PATH = 'backoffice/learningSupportTeam/formToHandleItem.html.twig';
		const LIST_FILE_PATH = 'backoffice/learningSupportTeam/list.html.twig';
	}