$(document).on("turbolinks:load",function(){
    $('#pre-selected-director').multiSelect({
        selectableHeader: "<div>Pick a director/s</div>",
        selectionHeader: "<div>Selected director</div>"
    });
    $('#pre-selected-cast').multiSelect({
            selectableHeader: "<div>Pick actors</div>",
            selectionHeader: "<div>Selected actors</div>"
    });
});