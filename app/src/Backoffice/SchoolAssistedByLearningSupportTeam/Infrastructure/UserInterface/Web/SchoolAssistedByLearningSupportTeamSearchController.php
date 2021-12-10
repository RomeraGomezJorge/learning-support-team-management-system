<?php
	
	declare(strict_types=1);
	
	
	namespace App\Backoffice\SchoolAssistedByLearningSupportTeam\Infrastructure\UserInterface\Web;

  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Collection\SchoolAssistedByLearningSupportTeamByCriteriaSearcher;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Application\Get\Collection\SchoolAssistedByLearningSupportTeamSearcher;
  use App\Backoffice\SchoolAssistedByLearningSupportTeam\Domain\SchoolAssistedByLearningSupportTeamRepository;
  use App\Shared\Infrastructure\Symfony\WebController;
  use Symfony\Component\HttpFoundation\JsonResponse;
  use Symfony\Component\HttpFoundation\Request;
  
  
  class SchoolAssistedByLearningSupportTeamSearchController extends WebController
	{
    const SORT_A_LIST_BY_NAME = 'name';
    const SORT_A_LIST_ALPHABETICALLY = 'asc';
    const LIST_BEGIN_ON_0 = 0;
    const LIST_END_ON_1000 = 1000;
  
		public function __invoke(
		  Request $request,
      SchoolAssistedByLearningSupportTeamByCriteriaSearcher $schoolAssistedByLearningSupportTeamByCriteriaSearcher
    ): JsonResponse
    {
      $fullname = $request->get('fullname');
      
      $filters = [];
      
      $this->addNameFilterIfNotNull($fullname ,$filters);
  
      $this->addNumberFilterIfNotNull($fullname, $filters);
  
      $schools = $schoolAssistedByLearningSupportTeamByCriteriaSearcher->__invoke(
        $filters,
        self::SORT_A_LIST_BY_NAME,
        self::SORT_A_LIST_ALPHABETICALLY,
        self::LIST_END_ON_1000,
        self::LIST_BEGIN_ON_0);
      
      return new JsonResponse(array_map(function ($schools){
        return [
            'id' => $schools->id(),
            'name' => $schools->name(),
            'number' => $schools->number()
          ];
      },$schools));
		}
  
    private function addNameFilterIfNotNull( string $fullname,array &$filters): void
    {
      $name = preg_replace('#[0-9 ]*#', '', $fullname);
  
      if (!empty($name)) {
        $filters[0]['field'] = 'name';
        $filters[0]['operator'] = 'CONTAINS';
        $filters[0]['value'] = $name;
      }
      
    }
  
    private function addNumberFilterIfNotNull( string $fullname,array &$filters): void
    {
      $number = preg_replace('/[^0-9]/', '', $fullname);
  
      if (!empty($number)) {
        $filters[1]['field'] = 'number';
        $filters[1]['operator'] = 'CONTAINS';
        $filters[1]['value'] = $number;
      }
    }
		
	}
	