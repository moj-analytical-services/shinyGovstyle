
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



// make navbar 'sticky' on scroll
$(document).scroll(function () {

  // Get the navbar
  var nav_contents = document.getElementById("govuk-contents-box");


  // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you    leave the scroll position
  if (window.pageYOffset >= document.getElementById("nav").offsetTop) {
     nav_contents.classList.add("govuk-contents-box_sticky")

    } else {
    nav_contents.classList.remove("govuk-contents-box_sticky");
  }


});

// Avoid the different widths caused by changing between fixed and static divs?
function set_contents_box_width(){
   var new_width = $('#nav').width();
  $('#govuk-contents-box').width(new_width);
}

$(document).scroll(function () {
 set_contents_box_width();
});

$(window).resize(function () {
 set_contents_box_width();
});


// Scroll to top of main col
$(document).on('click', '.govuk-contents__link', function(e) {

 document.getElementById("main_col").scrollIntoView()

});
