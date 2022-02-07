$(document).on('click', '.govuk-accordion__section-button', function(e) {

  var str = e.target.name;
  var level = str.substring(str.length-1);

  var cur_class = $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent()[0].classList.value

  if(cur_class == "govuk-accordion__section") {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().addClass("govuk-accordion__section--expanded");
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().removeClass("govuk-accordion-nav__chevron--down")[0];
  } else {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().removeClass("govuk-accordion__section--expanded");
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().addClass("govuk-accordion-nav__chevron--down")[0];
  }

});

$(document).on('click', '.govuk-accordion__show-all', function(e) {

  var sections = document.getElementsByClassName('govuk-accordion__section');
  var chevrons = document.getElementsByClassName('govuk-accordion-nav__chevron');


  for(var i=0; i< sections.length; i++){
    if(sections[i].classList.value == "govuk-accordion__section") {
      sections[i].classList.add("govuk-accordion__section--expanded");
      chevrons[i].classList.remove("govuk-accordion-nav__chevron--down");
    } else {
      sections[i].classList.remove("govuk-accordion__section--expanded");
      chevrons[i].classList.add("govuk-accordion-nav__chevron--down");
    }
    console.log(chevrons[i].classList.value);
  }



});

