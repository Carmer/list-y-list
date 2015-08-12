var filterStartDateTasks = function() {
  $("#start_date_filter").on("keyup", function() {
    var filter = $(this).val();
    var table = $(".task_list")
    var tableRows = $('tr', table);
    $(tableRows).each(function(index, row){
      $(row).each(function(index, column){
        var startDate = $(this).children()[2]
      if ($(startDate).text().search(new RegExp(filter, "i")) === -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }

      })
    })
  })
}
