
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



