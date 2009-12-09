$(document).ready(function() {
  $(".toggleable").not(".open").hide();
  
  $(".toggle-handler").live("click", function() {
    $(this).children(".toggleable").toggle("blind");
  });
  
  $(".activate-keywords").bind("click", function(e) {
    e.preventDefault();
    $("body").toggleClass("highlight-keywords", 1000);
  });
});