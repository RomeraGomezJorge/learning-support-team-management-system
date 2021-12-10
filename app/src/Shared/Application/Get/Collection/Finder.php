<?php
  
  
  namespace App\Shared\Application\Get\Collection;
  
  
  interface Finder {
    
    public function __invoke(string $id);
  
  }