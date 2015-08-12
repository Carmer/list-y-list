function sortByTitle() {
  $(".sort_title").on("click", function() {
    var table = $(".task_list");
    var tableRows = $('tr', table);
    var ordered = tableRows.sort(sortTitles);

    $(tableRows).each(function() {
      $(this).remove()
    })

    $(ordered).each(function() {
      $(table).append($(this))
    })
    changeCompletedStatus();
  })
}


function sortTitles(a, b) {
    if ($($(a).children()[0]).text() > $($(b).children()[0]).text()) {
      return 1;
    }
    if ($($(a).children()[0]).text() < $($(b).children()[0]).text()) {
      return -1;
    } else {
      return 0;
    }
  }
