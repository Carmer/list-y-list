function incompletedEventsFilter() {
  $(".toggle_incompleted_tasks").on("click", function(event) {
    event.preventDefault;
    var table = $(".task_list")
    var tableRows = $('tr', table);

    showAllTableRows(tableRows);
    showIncompleteTasks(tableRows);
  })

}

function showIncompleteTasks(rows) {
  for (var i = 0; i < rows.length; i++) {
    if ($(rows[i]).data("status")) {
      $(rows[i]).toggle();
    }
  };
}
