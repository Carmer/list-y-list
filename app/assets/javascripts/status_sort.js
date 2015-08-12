function sortByStatus() {
  $(".sort_status").on("click", function() {
    var table = $(".task_list");
    var tableRows = $('tr', table);
    var orderedStatus = tableRows.sort(sortStatus);

    $(tableRows).each(function() {
      $(this).remove()
    })

    $(orderedStatus).each(function() {
      $(table).append($(this))
    })
    changeCompletedStatus();
  })
}

function sortStatus(a, b) {
    if ($($(a).children()[4]).text() > $($(b).children()[4]).text()) {
      return 1;
    }
    if ($($(a).children()[4]).text() < $($(b).children()[4]).text()) {
      return -1;
    } else {
      return 0;
    }
  }
