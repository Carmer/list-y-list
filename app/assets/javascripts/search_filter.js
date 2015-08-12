function searchEvents () {
  $("#search_bar").on("keyup", function() {
    var filter = $(this).val();
    var table = $(".task_list")
    var tableRows = $('tr', table);
    $(tableRows).each(function(_, row){
      var title = row.children[0]
      if ($(title).text().search(new RegExp(filter, "i")) === -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
    })
  })
}


function clearInputs() {
  $("#search_bar").on("focusout", function() {
    $(this).val("")
  })
}
