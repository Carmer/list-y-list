function completedEventsFilter() {
  $(".toggle_completed_tasks").on("click", function(event) {
    event.preventDefault;
    var table = $(".task_list")
    var tableRows = $('tr', table);

    showAllTableRows(tableRows);
    showCompleteTasks(tableRows);

  })

}

function showCompleteTasks(rows) {
  for (var i = 0; i < rows.length; i++) {
    if (!($(rows[i]).data("status"))) {
      $(rows[i]).toggle();
    }
  };
}
