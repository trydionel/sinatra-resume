var blink = function(element, speed) {
  if (speed === undefined) {
    speed = 50;
  }
  
  var antispeed = 1000 - speed;
  element.fadeOut(speed, function() {
    setTimeout(function() { element.fadeIn(speed, function() {
      setTimeout(function() { blink(element) }, antispeed)
    }) }, antispeed);
  });
};

$(document).ready(function() {
  $(".toggleable").not(".open").hide();
  
  // Obnoxious blinky cursor!
  blink($(".cursor"));
  
  $(".toggle-handler").live("click", function() {
    $(this).children(".toggleable").toggle("blind");
  });
  
  $(".activate-keywords").bind("click", function(e) {
    e.preventDefault();
    $("#content").toggleClass("highlight-keywords", 1000);
  });
});