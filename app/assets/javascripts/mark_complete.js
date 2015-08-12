function changeCompletedStatus() {
  $(".task_complete").on("click", function(event){
    event.preventDefault();
    var row = $(this).closest("tr");
    var id = row.data("id");
    $(row).toggle();
    $.ajax({
      url: "/task/" + id + "/update",
      type: "put"
    })
  })
}
