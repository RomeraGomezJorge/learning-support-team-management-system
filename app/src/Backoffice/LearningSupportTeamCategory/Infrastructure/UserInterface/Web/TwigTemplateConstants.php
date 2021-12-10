<?php
	
	declare(strict_types=1);
	
	namespace App\Backoffice\LearningSupportTeamCategory\Infrastructure\UserInterface\Web;
	
	final class TwigTemplateConstants
	{
		const LIST_PATH = 'learning_support_team_category_list';
		const EDIT_PATH = 'learning_support_team_category_edit';
		const ADD_PATH = 'learning_support_team_category_add';
		const CREATE_PATH = 'learning_support_team_category_create';
		const UPDATE_PATH = 'learning_support_team_category_update';
		const DELETE_PATH = 'learning_support_team_category_delete';
		const NAME_AVAILABLE_PATH = 'learning_support_team_category_name_available';
		const SECTION_TITLE = 'Learning Support Team Category';
		const FORM_FILE_PATH = 'backoffice/learningSupportTeamCategory/formToHandleItem.html.twig';
		const LIST_FILE_PATH = 'backoffice/learningSupportTeamCategory/list.html.twig';
	}