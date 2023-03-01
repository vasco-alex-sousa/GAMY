// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

$(document).ready(function() {
  // Hide all tab content by default
  $(".tab-content").hide();

  // Show the first tab by default
  $("#listings").show();

  // Add click event handlers to the tabs
  $(".nav-link").click(function() {
    // Remove the active class from all tabs
    $(".nav-link").removeClass("active");

    // Add the active class to the clicked tab
    $(this).addClass("active");

    // Hide all tab content
    $(".tab-content").hide();

    // Show the tab content for the clicked tab
    var tab = $(this).attr("href");
    $(tab).show();

    // Prevent the default link behavior
    return false;
  });
});
