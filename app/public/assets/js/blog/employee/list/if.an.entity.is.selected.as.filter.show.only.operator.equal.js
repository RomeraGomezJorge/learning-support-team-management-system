function ifAnEntityIsSelectedAsFilterShowOnlyOperatorEqual(field) {

    const operator = $(field).parent().parent().find('.filter-operator');

    const entityFilters = ["jobDesignation", "employmentContract", "learningSupportTeam"];

    if (entityFilters.includes($(field).val())) {
        operator.val('=');
        operator.children('option').hide();
    }

}



