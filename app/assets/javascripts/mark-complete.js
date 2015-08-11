function changeCompletedStatus() {
  $(".task_complete").on("click", function(event){
    event.preventDefault();
    $(this).closest("tr").toggle();
  })
}
