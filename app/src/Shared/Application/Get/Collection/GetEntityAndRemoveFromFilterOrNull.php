<?php
  
  
  namespace App\Shared\Application\Get\Collection;
  
  
  use App\Shared\Infrastructure\Utils\FilterUtilsForAssociationField;

  final class GetEntityAndRemoveFromFilterOrNull {
    
    public function __invoke(array &$filter,Finder $finder, string $associationFieldName) {
      
      if (!FilterUtilsForAssociationField::isFieldNameDefineAsFilter($filter,
        $associationFieldName)) {
        return NULL;
      };
  
      $id = FilterUtilsForAssociationField::getValueFromFilters(
        $filter,
        $associationFieldName
      );
      
      $filter =$this->removeAssociationsFilter($filter,$associationFieldName);
  
      return $finder->__invoke($id);
      
    }
  
    public function removeAssociationsFilter($filter,$associationFieldName): array {
      return FilterUtilsForAssociationField::removeFilterEqualsTo(
        [$associationFieldName],
        $filter
      );
    }
    
  }