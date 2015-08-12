function sortByTitle() {
  $(".sort_title").on("click", function() {
    var table = $(".task_list");
    var tableRows = $('tr', table);

    $(tableRows).each(function() {
      $(this).remove()
    })

    var ordered = tableRows.sort(sortTitles);

    $(ordered).each(function() {
      $(table).append($(this))
    })


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
