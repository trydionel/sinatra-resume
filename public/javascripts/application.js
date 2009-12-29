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
  $(".closed").children(".toggleable").hide();
  
  // Obnoxious blinky cursor!
  blink($(".cursor"));
  
  $(".toggle-handler").bind("click", function() {
    $(this).toggleClass("closed");
    $(this).toggleClass("open");
    $(this).children(".toggleable").toggle("blind");
  });
  
  $(".activate-keywords").bind("click", function(e) {
    e.preventDefault();
    var button = $(this);
    if (button.text() == "Show Keywords") {
      $(this).text("Hide Keywords");
      $("#content").find(".keyword").animate({ color: "#ff0000" }, 1000);      
    } else {
      $(this).text("Show Keywords");
      $("#content").find(".keyword").animate({ color: "#ffffff" }, 1000);            
    }
  });
});