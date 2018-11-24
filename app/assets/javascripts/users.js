document.addEventListener("turbolinks:load", function(){
  $('.startDate-picker').datepicker({
      format: "dd/mm/yyyy",
      daysOfWeekDisabled: "0,2,3,4,5,6",
      daysOfWeekHighlighted: "1"
  });
})
