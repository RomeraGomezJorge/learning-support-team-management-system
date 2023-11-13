<?php

namespace App\Shared\Infrastructure\Persistence\Doctrine;

use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;

abstract class DoctrineRepository
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    protected function persistMultipleEntities(array $arrayOfEntities): void
    {
        array_walk($arrayOfEntities, function ($entity): void {
            $this->entityManager()->persist($entity);
        });

        $this->entityManager()->flush();
    }

    protected function persist($entity): void
    {
        $this->entityManager()->persist($entity);
        $this->entityManager()->flush($entity);
    }

    protected function entityManager(): EntityManagerInterface
    {
        return $this->entityManager;
    }

    protected function removeMultipleEntities(array $arrayOfEntities): void
    {
        array_walk($arrayOfEntities, function ($entity): void {
            $this->entityManager()->remove($entity);
        });

        $this->entityManager()->flush();
    }

    protected function remove($entity): void
    {
        $this->entityManager()->remove($entity);
        $this->entityManager()->flush($entity);
    }

    protected function repository($entityClass): EntityRepository
    {
        return $this->entityManager->getRepository($entityClass);
    }
}
