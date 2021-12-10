<?php
	
	declare(strict_types=1);
	
	namespace App\Shared\Infrastructure\Persistence\Doctrine;
	
	use App\Shared\Domain\Criteria\Criteria;
	use App\Shared\Domain\Criteria\Filter;
	use App\Shared\Domain\Criteria\FilterField;
	use App\Shared\Domain\Criteria\OrderBy;
	use DateTime;
	use Doctrine\Common\Collections\Criteria as DoctrineCriteria;
	use Doctrine\Common\Collections\Expr\Comparison;
	use Doctrine\Common\Collections\Expr\CompositeExpression;
	
	final class DoctrineCriteriaConverter
	{
		private Criteria $criteria;
		private array    $criteriaToDoctrineFields;
		private array    $hydrators;
		
		public function __construct(Criteria $criteria, array $criteriaToDoctrineFields = [], array $hydrators = [])
		{
			$this->criteria = $criteria;
			$this->criteriaToDoctrineFields = $criteriaToDoctrineFields;
			$this->hydrators = $hydrators;
		}
		
		public static function convert(
			Criteria $criteria,
			array $criteriaToDoctrineFields = [],
			array $hydrators = []
		): DoctrineCriteria {
			$converter = new self($criteria, $criteriaToDoctrineFields, $hydrators);
			
			return $converter->convertToDoctrineCriteria();
		}
		
		private function convertToDoctrineCriteria(): DoctrineCriteria
		{
			return new DoctrineCriteria(
				$this->buildExpression($this->criteria),
				$this->formatOrder($this->criteria),
				$this->criteria->offset(),
				$this->criteria->limit()
			);
		}
		
		private function buildExpression(Criteria $criteria): ?CompositeExpression
		{
			if ($criteria->hasFilters()) {
				return new CompositeExpression(
					CompositeExpression::TYPE_AND,
					array_map($this->buildComparison(), $criteria->plainFilters())
				);
			}
			
			return null;
		}
		
		private function buildComparison(): callable
		{
			return function (Filter $filter): Comparison {
				$field = $this->mapFieldValue($filter->field());
				$value = $this->existsHydratorFor($field)
					? $this->hydrate($field, $filter->value()->value())
					: $filter->value()->value();
				
				$value = trim($value);
				
				if (strtolower($value) === 'null' || is_null($value)) {
					$value = null;
				}
				
        if (is_string($value)  && DateTime::createFromFormat('Y-m-d H:i:s', $value) !== false ) {
				 
					$newDate = new DateTime($value);
					
					$newDate = $newDate->format("Y-m-d H:i:s");
					
					$value = new DateTime($newDate);
				}
        
        if (is_string($value) && $this->isValidateDate($value)) {
          
          $newDate = new DateTime($value);
          
          $newDate = $newDate->format("Y-m-d");
          
          $value = new DateTime($newDate);
        }
				return new Comparison($field, $filter->operator()->value(), $value);
			};
		}
    
    private function isValidateDate($date):bool
    {
      
      if (substr_count($date,'-') != 2) {
        return false;
      }
      
      $tempDate = explode('-', $date);
      // checkdate(month, day, year
      return checkdate((int)$tempDate[1], (int)$tempDate[0], (int)$tempDate[2]);
    }
		
		private function mapFieldValue(FilterField $field)
		{
			return array_key_exists($field->value(), $this->criteriaToDoctrineFields)
				? $this->criteriaToDoctrineFields[$field->value()]
				: $field->value();
		}
		
		private function existsHydratorFor($field): bool
		{
			return array_key_exists($field, $this->hydrators);
		}
		
		private function hydrate($field, $value)
		{
			return $this->hydrators[$field]($value);
		}
		
		private function formatOrder(Criteria $criteria): ?array
		{
			if (!$criteria->hasOrder()) {
				return null;
			}
			
			return [$this->mapOrderBy($criteria->order()->orderBy()) => $criteria->order()->orderType()];
		}
		
		private function mapOrderBy(OrderBy $field)
		{
			return array_key_exists($field->value(), $this->criteriaToDoctrineFields)
				? $this->criteriaToDoctrineFields[$field->value()]
				: $field->value();
		}
	}
