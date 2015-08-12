var filterDueDateTasks = function() {
  $("#due_date_filter").on("keyup", function() {
    var filter = $(this).val();
    var table = $(".task_list")
    var tableRows = $('tr', table);
    $(tableRows).each(function(index, row){
      $(row).each(function(index, column){
        var dueDate = $(this).children()[3]
      if ($(dueDate).text().search(new RegExp(filter, "i")) === -1) {
        $(this).addClass("hidden")
      }
      else {
        $(this).removeClass("hidden")
      }
      })
    })
    searchEvents();
  })
}
