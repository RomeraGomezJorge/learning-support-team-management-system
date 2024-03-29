/* prevent user close modal when data is being processed */
function hideElementsCanCloseModal(topCrossSelector, cancelButtonSelector) {

    $(cancelButtonSelector).hide();

    $(topCrossSelector).hide();
}

/* prevent user close modal when data is being processed */
function disableCloseModalWhenClickOutside(modalSelector) {
    $(modalSelector).data('bs.modal')._config.keyboard = false;
    $(modalSelector).data('bs.modal')._config.backdrop = 'static';
}

/* notify user with spinner on submit button that data is being processed */
function replaceSubmitButtonWithLoadingSpinner(submitButtonSelector) {
    $(submitButtonSelector).addClass('is-loading');
    $(submitButtonSelector).attr('is-loading');
}

/*Replace innerHTML of a class '.modal-content' in a modal to notify user that something was right */
function replaceModalContentBySuccessMessage(modalSelector, successMessage) {

    $(modalSelector).html('' +
        '<div class="modal-dialog modal-confirm">' +
        '   <div class="modal-content">' +
        '      <div class="modal-header flex-column">' +
        '         <div class="icon-box text-success" >' +
        '           <i class="fas fa-check" ></i>' +
        '         </div>' +
        '         <h4 class="modal-title w-100">' + successMessage + '</h4>' +
        '         <button type="button" class="close d-none d-sm-block" data-dismiss="modal" aria-hidden="true">×</button>' +
        '      </div>' +
        '      <div class="modal-footer justify-content-center">' +
        '         <button type="button" class="btn btn-success text-white btn-block" data-dismiss="modal" autofocus>' +
        '             <span class="btn-label"> ' +
        '                 <i class="fas fa-check-circle"></i> ' +
        '             </span> ' +
        '              Continuar' +
        '         </button>' +
        '      </div>' +
        '   </div>' +
        '</div>');

    hideModalAfterFewSeconds(modalSelector);
}

/*Replace innerHTML of a class '.modal-content' in a modal to notify user that something was wrong */
function replaceModalContentByFailMessage(modalSelector, errorDetails, millisecondsToShowErrorMessage = 10000) {
    $(modalSelector).html('' +
        '   <div class="modal-dialog modal-confirm">' +
        '           <div class="modal-content">' +
        '              <div class="modal-header flex-column">' +
        '                 <div class="icon-box text-danger">' +
        '                   <i class="fas fa-times" ></i>' +
        '                 </div>' +
        '                 <h4 class="modal-title w-100">'+ Translator.trans('An error has occurred!')+'</h4>' +
        '                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>' +
        '              </div>' +
        '              <div class="modal-body modal-message-to-delete-confirmation">' + errorDetails + '</div>' +
        '              <div class="modal-footer justify-content-center">' +
        '                 <button type="button" class="btn btn-focus btn-block" data-dismiss="modal" >' +
        '                     <span class="btn-label"> ' +
        '                          <i class="fas fa-times-circle"></i> ' +
        '                      </span> ' +
        '                     ' +Translator.trans('Close') +
        '                  </button>' +
        '           </div>' +
        '       </div>' +
        '   </div>');

    hideModalAfterFewSeconds(modalSelector, millisecondsToShowErrorMessage);
}

/*Replace innerHTML of a class '.modal-content' in a modal to notify user that something is processing */
function replaceModalContentByLoadingMessage(modalSelector) {
    $(modalSelector).html('' +
        '<div class="modal-dialog modal-confirm">' +
        '   <div class="modal-content">' +
        '       <div class="modal-header flex-column">' +
        '          <div class="icon-box text-primary fa-3x" >' +
        '            <i class="fas fa-sync fa-spin" ></i>' +
        '          </div>' +
        '          <h4 class="modal-title w-100">'+Translator.trans('Loading')+'...</h4>' +
        '       </div>' +
        '   </div>' +
        '</div>');


}

function renderFormToHandleDataInModal(event, modalSelector, urlToGetFormHtml, data = '') {
    const errorDetails = Translator.trans('An unexpected error occurred trying to delete the record, please try again.If the error persists, please contact support.');

    $.ajax({
        url: urlToGetFormHtml,
        type: "GET",
        data: data,
        cache: false,
        success: function (response) {
            if (response.status != 'success') {
                replaceModalContentByFailMessage(modalSelector, errorDetails);
                return;
            }

            $(modalSelector).html(response.html);

        },
        error: function () {
            replaceModalContentByFailMessage(modalSelector, errorDetails);
        }
    });
}

/* allow user close modal because data has been processed */
function enableCloseModalWhenClickOutside(modalSelector) {

    $(modalSelector).data('bs.modal')._config.keyboard = true;
    $(modalSelector).data('bs.modal')._config.backdrop = true;
}

function hideModalAfterFewSeconds(modalSelector, closeModalAfter = 2000) {
    const modal = modalSelector;

    setTimeout(function () {
        $(modal).modal('hide');

        $(modal).html('        <div class="modal-dialog modal-confirm">\n' +
            '            <div class="modal-content">\n' +
            '                <div class="modal-header flex-column">\n' +
            '                    <div class="icon-box text-primary fa-3x">\n' +
            '                        <i class="fas fa-sync fa-spin"></i>\n' +
            '                    </div>\n' +
            '                    <h4 class="modal-title w-100">'+ Translator.trans('Loading')+'...</h4>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>')
    }, closeModalAfter)

}
