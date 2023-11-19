<?php

namespace App\Shared\Infrastructure\Constant;

final class MessageConstant
{
    const SUCCESS_MESSAGE_TO_CREATE = 'The data has been created.';
    const SUCCESS_MESSAGE_TO_UPDATE = 'The data has been updated.';
    const INVALID_TOKEN_CSFR_MESSAGE = 'The CSRF token is not valid.';
    const UNEXPECTED_ERROR_HAS_OCCURRED_ON_DELETE = 'An unexpected error occurred while trying to delete, please try again.';
}
