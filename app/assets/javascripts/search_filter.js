var searchEvents = function() {
  $("#search_bar").on("keyup", function() {
    var filter = $(this).val();
    var table = $(".task_list")
    var tableRows = $('tr', table);

    $(tableRows).each(function(){
      if ($(this).text().search(new RegExp(filter, "i")) === -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
    })

  })

}
