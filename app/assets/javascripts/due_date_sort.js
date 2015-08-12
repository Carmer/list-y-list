function sortByDueDate() {
  $(".sort_due_date").on("click", function() {
    var table = $(".task_list");
    var tableRows = $('tr', table);
    var orderedDate = tableRows.sort(sortDueDates);

    $(tableRows).each(function() {
      $(this).remove()
    })

    $(orderedDate).each(function() {
      $(table).append($(this))
    })
    changeCompletedStatus();
    searchEvents();
  })
}


function sortDueDates(a, b) {
    return new Date($($(a).children()[3]).text()) - new Date($($(b).children()[3]).text());
  }
