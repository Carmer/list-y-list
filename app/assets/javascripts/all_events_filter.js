function allEventsFilter() {
  $(".toggle_all_tasks").on("click", function(event) {
    event.preventDefault();
    $("#search_bar").val("")
    var table = $(".task_list");
    var tableRows = $('tr', table);

    showAllTableRows(tableRows);
  });
    searchEvents();
    filterStartDateTasks();
    filterDueDateTasks();
}


function showAllTableRows(rows) {
  for (var i = 0; i < rows.length; i++) {
    if ($(rows[i]).is(":hidden")) {
      $(rows[i]).removeClass("hidden");
      searchEvents();
    }
  };
  searchEvents();
  filterStartDateTasks();
  filterDueDateTasks();
}
