<?php
	
	namespace App\Shared\Infrastructure\Symfony;
	
	
	use App\Shared\Domain\Utils;
	use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;
	use Symfony\Contracts\Translation\TranslatorInterface;
	
	final class FlashSession
	{
		private array  $flashes;
		/**
		 * @var FlashBagInterface
		 */
		private $session;
		/**
		 * @var TranslatorInterface
		 */
		private $translator;
		
		public function __construct(FlashBagInterface $session)
		{
			$this->session = $session;
		}
		
		public function get(string $key, $default = null)
		{
			$this->setFlashMessages();
			
			
			if (array_key_exists($key, $this->flashes)) {
				return $this->flashes[$key];
			}
			
			if (array_key_exists($key . '.0', $this->flashes)) {
				return $this->flashes[$key . '.0'];
			}
			
			if (array_key_exists($key . '.0.0', $this->flashes)) {
				return $this->flashes[$key . '.0.0'];
			}
			
			return $default;
		}
		
		public function setFlashMessages()
		{
			if (empty($this->flashes)) {
				$this->flashes = Utils::dot($this->session->all());
			}
			
			return $this->flashes;
		}
		
		public function has(string $key): bool
		{
			$this->setFlashMessages();
			
			return array_key_exists($key, $this->flashes) ||
				array_key_exists($key . '.0', $this->flashes) ||
				array_key_exists($key . '.0.0', $this->flashes);
		}
	}
