<?php
  
  declare(strict_types=1);
  
  namespace App\Shared\Infrastructure\Storage;
  
  
  use App\Shared\Domain\AttachmentHandler;
  use Exception;
  use Symfony\Component\DependencyInjection\ContainerInterface;
  use Symfony\Component\Filesystem\Filesystem;
  
  final class LocalAttachmentHandler implements AttachmentHandler {
    
    private ContainerInterface $container;
    
    private Filesystem $filesystem;
    
    public function __construct(
      Filesystem $filesystem,
      ContainerInterface $container
    ) {
      $this->filesystem = $filesystem;
      $this->container = $container;
    }
    
    public function delete(
      string $attachmentDirectory,
      string $attachmentFileName
    ): void {
      try {
        $this->filesystem->remove(
          $this->container->getParameter($attachmentDirectory) . '/' . $attachmentFileName
        );
      } catch (Exception $e) {
        $e->getMessage();
      }
    }
    
  }