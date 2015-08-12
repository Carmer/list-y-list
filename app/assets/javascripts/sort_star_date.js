function sortByStartDate() {
  $(".sort_start_date").on("click", function() {
    var table = $(".task_list");
    var tableRows = $('tr', table);
    var orderedDate = tableRows.sort(sortStartDates);

    $(tableRows).each(function() {
      $(this).remove()
    })

    $(orderedDate).each(function() {
      $(table).append($(this))
    })
    changeCompletedStatus();
  })
}

function sortStartDates(a, b) {
    return new Date($($(a).children()[2]).text()) - new Date($($(b).children()[2]).text());
  }
