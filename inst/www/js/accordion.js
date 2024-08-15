$(document).on('click', '.govuk-accordion__section-button', function(e) {

  var str = e.target.name;
  var level = str.substring(str.length-1);

  var cur_class = $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent()[0].classList.value



  if(cur_class == "govuk-accordion__section") {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().addClass("govuk-accordion__section--expanded");
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().removeClass("govuk-accordion-nav__chevron--down")[0];

         $('[name="accordion-default-heading-' + level + '"]').children().children().children()[1].innerHTML = "Hide"

  } else {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().removeClass("govuk-accordion__section--expanded");
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().addClass("govuk-accordion-nav__chevron--down")[0];

    // if any section set to hidden want the show all section to show
     document.getElementById("show-all-chevron").classList.add("govuk-accordion-nav__chevron--down")
     $('[name="accordion-default-heading-' + level + '"]').children().children().children()[1].innerHTML = "Show"
  }

});

$(document).on('click', '.govuk-accordion__show-all', function(e) {

  var sections = document.getElementsByClassName('govuk-accordion__section');
  var chevrons = document.getElementsByClassName('govuk-accordion-nav__chevron');

  var toggle_text = document.getElementsByClassName('govuk-accordion__section-toggle-text');

  var show_all_chevron_class = document.getElementById("show-all-chevron").classList.value;


for(var i=0; i< sections.length; i++){

  if(show_all_chevron_class != "govuk-accordion-nav__chevron"){

      document.getElementsByClassName("govuk-accordion__show-all-text")[0].innerHTML = "Hide all sections";

      if(sections[i].classList.value == "govuk-accordion__section") {
      sections[i].classList.add("govuk-accordion__section--expanded");
      chevrons[i+1].classList.remove("govuk-accordion-nav__chevron--down");

      chevrons[0].classList.remove("govuk-accordion-nav__chevron--down");
      toggle_text[i].innerHTML = "Hide";

    }


  } else {

    document.getElementsByClassName("govuk-accordion__show-all-text")[0].innerHTML = "Show all sections";

     if(sections[i].classList.value != "govuk-accordion__section") {
      sections[i].classList.remove("govuk-accordion__section--expanded");
      chevrons[i+1].classList.add("govuk-accordion-nav__chevron--down");

      chevrons[0].classList.add("govuk-accordion-nav__chevron--down");

      toggle_text[i].innerHTML = "Show";

    }

  }

}



});

