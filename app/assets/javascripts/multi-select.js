$(document).on("turbolinks:load",function(){
    $('#pre-selected-director').multiSelect({
        selectableHeader: "<div>Pick an director/s/div>",
        selectionHeader: "<div>Selected director</div>"
    });
    $('#pre-selected-cast').multiSelect({
            selectableHeader: "<div>List of actors</div>",
            selectionHeader: "<div>Selected actors</div>"
    });
});