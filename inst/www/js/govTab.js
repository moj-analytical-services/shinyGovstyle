$(document).on('click', '.govuk-tabs__list-item', function(e) {

  // Get some ids for the button that was clicked.  Need a few things to make
  // isolate to the correct table
  var str = e.target.name;
  var tab = str.substring(0, str.length-2);
  var tabID = $('[name="' + str + '"]').parent().parent()[0].id;
  var mainID = tabID.substring(0, tabID.length-3);

  // Remove selected tab from all tabs and add hidden to all tables
  $("#" + tabID).children().removeClass("govuk-tabs__list-item--selected");
  $('[name$="-' + mainID + '-table"]').addClass("govuk-tabs__panel--hidden");

  // Add back the selected tab that was clicked and unhide right table
  $('[name="' + tab + '-t"]').addClass("govuk-tabs__list-item--selected");
  $('[name="' + tab + '-' + mainID + '-table"]').removeClass("govuk-tabs__panel--hidden");

});





// contents links JS
$(document).on('click', '.govuk-contents__link', function(e) {

  // get subcontents sections
  var subsections = document.getElementsByClassName("govuk-subcontents");

  // close all other subsections except in the section of the link you are clicking
  for (var i = 0; i < subsections.length; i++) {

    if(subsections[i].parentElement.children[0].id === event.target.id) {
      subsections[i].style.display = "block"

    } else {
       subsections[i].style.display = "none"

    }

  }

});
