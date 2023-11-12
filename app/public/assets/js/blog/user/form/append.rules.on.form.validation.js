$(document).ready(function () {

    appendRuleAtLeastOneNumber();

    appendRuleAtLeastOneUppercase();

    appendRuleRequiredRoleId();
});

function appendRuleAtLeastOneUppercase() {
    $.validator.addMethod("atLeastOneUppercase", function (value) {
        return /[A-Z]/.test(value);
    }, Translator.trans('Uppercase and lowercase letters'));

    $('input[name="password"]').rules("add", {
        atLeastOneUppercase: true
    });
}

function appendRuleAtLeastOneNumber() {
    $.validator.addMethod("atLeastOneNumber", function (value) {
        return /[0-9]/.test(value);
    }, Translator.trans('At least one number.'));

    $('input[name="password"]').rules("add", {
        atLeastOneNumber: true
    });
}

function appendRuleRequiredRoleId() {
    $('input[name="role_id"]').rules("add", {
        required: true
    });
}
