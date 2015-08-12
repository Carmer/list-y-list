function changeCompletedStatus() {
  $(".task_complete").on("click", function(event){
    event.preventDefault();
    var row = $(this).closest("tr");
    var statusColumn = $(row).children()[4];
    var statusButtonColumn = $(row).children()[5];
    var id = row.data("id");
    var newStatus = !($(row).data("status"))
    $.ajax({
      url: "/task/" + id + "/update",
      type: "put",
      success: function() {
        $(row).data("status", newStatus)
        updateStatusColumn.call(row, statusColumn)
      },
      error: function() {
        alert("Something went wrong. Please try again.")
      }
    })
  })
}

function updateStatusColumn(status) {
  if ($(status).text() === "Incomplete") {
    $(this.children()[4]).text("Complete")
    $(this.children()[5]).html("<button type='button' class='btn yellow darken-2 task_complete' name='button'>Mark Incomplete</button>")
    $(this.children()[5]).css(".btn yellow")
    changeCompletedStatus();
    searchEvents();
  } else {
    $(this.children()[4]).text("Incomplete")
    $(this.children()[5]).html("<button type='button' class='btn green task_complete' name='button'>Mark Complete</button>")
    $(this.children()[5]).css(".btn")
    changeCompletedStatus();
    searchEvents();
  }
}
