$(function() {
  changeCompletedStatus();
  allEventsFilter();
  completedEventsFilter();
  incompletedEventsFilter();
  futureEventsFilter();
  sortByTitle();
  sortByDueDate();
  sortByStatus();
  sortByStartDate();
  filterStartDateTasks();
  filterDueDateTasks();
  searchEvents();
  clearInputs();
});
