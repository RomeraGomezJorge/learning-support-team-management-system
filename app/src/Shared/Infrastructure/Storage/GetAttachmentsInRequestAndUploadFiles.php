<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Storage;

use App\Backoffice\Document\Domain\ValueObject\Attachment\ValueObject\AttachmentType;
use App\Shared\Infrastructure\Symfony\WebController;
use InvalidArgumentException;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

final class GetAttachmentsInRequestAndUploadFiles extends WebController
{
    private const ALLOWED_IMAGE_EXTENSIONS = ['jpg', 'jpeg', 'png'];
    private const ALLOWED_DOCUMENT_EXTENSIONS = [
        'dot',
        'wbk',
        'docx',
        'docm',
        'dotx',
        'dotm',
        'docb',
        'xls',
        'xlt',
        'xlm',
        'xlsx',
        'xlsm',
        'xltx',
        'xltm',
        'xlsb',
        'xla',
        'xlam',
        'xll',
        'xlw',
        'ppt',
        'pot',
        'pps',
        'pptx',
        'pptm',
        'potx',
        'potm',
        'ppam',
        'ppsx',
        'ppsm',
        'sldx',
        'sldm',
        'pdf',
        'txt',
    ];

    private const FILE_NOT_FOUND_ON_REQUEST = null;
    private SluggerInterface $slugger;

    public function __construct(
        SluggerInterface    $slugger,
        ValidatorInterface  $validator,
        TranslatorInterface $translator
    )
    {
        parent::__construct($validator,$translator);
        $this->slugger    = $slugger;
    }

    public function __invoke(Request $request, string $documentName, string $attachmentDirectory)
    {

        $attachmentDescription = $request->get('attachment');

        $attachment = [];

        $files = $request->files->get('attachment');

        if ($files === self::FILE_NOT_FOUND_ON_REQUEST) {
            return null;
        }

        foreach (array_keys($files) as $key) {
            if (!$files[$key]['file']) {
                continue;
            }

            $extension = $files[$key]['file']->guessExtension();

            $fileName = $documentName . ' ' . $attachmentDescription[$key]['description'];

            $attachment[$key]['url']         = $this->uploadFileAndGetFileLink($files[$key]['file'], $fileName, $attachmentDirectory);
            $attachment[$key]['description'] = $attachmentDescription[$key]['description'];
            $attachment[$key]['type']        = $this->getFileType($extension);
        }

        return $this->arrayToObject($attachment);
    }

    private function uploadFileAndGetFileLink(
        UploadedFile $fileToUpload,
        string       $name,
        string       $attachmentDirectory
    ): string
    {
        $fileName = $this->slugger->slug($name . '-' . uniqid()) . '.' . $fileToUpload->guessExtension();

        try {
            /* make sure your folder has permissions to write*/
            $fileToUpload->move($this->getParameter($attachmentDirectory), $fileName);
        } catch (FileException $e) {
            $e->getMessage();
        }

        return $fileName;
    }

    private function getFileType(string $extension): string
    {
        switch ($extension) {
            case in_array($extension, self::ALLOWED_IMAGE_EXTENSIONS):
                return AttachmentType::IMAGE;
            case in_array($extension, self::ALLOWED_DOCUMENT_EXTENSIONS):
                return AttachmentType::DOCUMENT;
            default:
                // TODO: translate TranslatorInterface $translator
                throw new InvalidArgumentException('Este tipo ' . $extension . ' de archivo no está permitido por razones de seguridad');
        }
    }

    private function arrayToObject(array $arrayToConvent)
    {
        $arrayFormat = json_encode($arrayToConvent);

        return json_decode($arrayFormat);
    }
}
