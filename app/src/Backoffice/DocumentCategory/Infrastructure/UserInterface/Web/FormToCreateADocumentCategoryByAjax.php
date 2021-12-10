<?php
  
  declare(strict_types=1);
  
  namespace App\Backoffice\DocumentCategory\Infrastructure\UserInterface\Web;
  
  use App\Shared\Infrastructure\Constant\FormConstant;
  use App\Shared\Infrastructure\RamseyUuidGenerator;
  use App\Shared\Infrastructure\RenderFormInterface;
  use App\Shared\Infrastructure\Symfony\FlashSession;
  use App\Shared\Infrastructure\Symfony\WebController;
  
  final class FormToCreateADocumentCategoryByAjax extends WebController implements RenderFormInterface {
    
    private RamseyUuidGenerator $ramseyUuidGenerator;
    
    private FlashSession $flashSession;
    
    public function __construct(
      RamseyUuidGenerator $ramseyUuidGenerator,
      FlashSession $flashSession
    ) {
      $this->ramseyUuidGenerator = $ramseyUuidGenerator;
      $this->flashSession = $flashSession;
    }
    
    public function __invoke(): ?string {
      return $this->render(TwigTemplateConstants::CREATE_BY_AJAX_FILE_PATH, [
        'form_action_attribute' => TwigTemplateConstants::CREATE_BY_AJAX_PATH,
        'id' => $this->ramseyUuidGenerator->generate(),
        'name' => $this->flashSession->get('inputs.name'),
        'name_available_path' => TwigTemplateConstants::NAME_AVAILABLE_PATH,
        'submit_button_label' => FormConstant::SUBMIT_BUTTON_VALUE_TO_CREATE,
      ])->getContent();
    }
    
  }