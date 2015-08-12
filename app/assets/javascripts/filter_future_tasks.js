function futureEventsFilter() {

  $(".toggle_future_tasks").on("click", function(event) {
    event.preventDefault;
    var table = $(".task_list");
    var tableRows = $('tr', table);

    showAllTableRows(tableRows);
    showFutureEvents(tableRows);
    searchEvents();
    filterStartDateTasks();
    filterDueDateTasks();
  })

}

function showFutureEvents(rows) {
  for (var i = 0; i < rows.length; i++) {
    if ($(rows[i]).data("notFutureTask")) {
      $(rows[i]).toggle();
    }
  };
}
