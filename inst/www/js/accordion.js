$(document).on('click', '.govuk-accordion__section-button', function(e) {

  var str = e.target.name;
  var level = str.substring(str.length-1);

  var cur_class = $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent()[0].classList.value

  if(cur_class == "govuk-accordion__section") {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().addClass("govuk-accordion__section--expanded");
  } else {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().removeClass("govuk-accordion__section--expanded");
  }

});
