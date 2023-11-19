<?php

 declare(strict_types=1);

  namespace App\Shared\Application\Get\Collection;

  use App\Shared\Infrastructure\Utils\FilterUtilForAssociationField;

  final class GetEntityAndRemoveFromFilterOrNull
{
    public function __invoke(array &$filter, Finder $finder, string $associationFieldName)
    {

        if (
            !FilterUtilForAssociationField::isFieldNameDefineAsFilter(
                $filter,
                $associationFieldName
            )
        ) {
            return null;
        };

        $id = FilterUtilForAssociationField::getValueFromFilters(
            $filter,
            $associationFieldName
        );

        $filter = $this->removeAssociationsFilter($filter, $associationFieldName);

        return $finder->__invoke($id);
    }

    public function removeAssociationsFilter($filter, $associationFieldName): array
    {
        return FilterUtilForAssociationField::removeFilterEqualsTo(
            [$associationFieldName],
            $filter
        );
    }
}
