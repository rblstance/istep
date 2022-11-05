$('#search_member').on('click', function() {
    $('#s_result').load(location.href + "#s_result");
});

$('#add_member').on('click', function() {
    $('#mem_list').load(location.href + "#mem_list");
});