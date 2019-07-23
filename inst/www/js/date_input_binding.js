var exports4but = window.Shiny = window.Shiny || {};
var $escape4but = exports4but.$escape = function(val) {
  return val.replace(/([!"#$%&'()*+,.\/:;<=>?@\[\\\]^`{|}~])/g, '\\$1');
};


// create a binding object
var date_binding = new Shiny.InputBinding();

// add methods to it using jQuery's extend method
$.extend(date_binding, {

  find: function(scope) {
    return $(scope).find(".govuk-date-input");
  },

  getId: function(el) {
    return el.id;
  },

  // this method will also be called on initialisation (to pass the intial state to input$...)
  // and each time when the callback is triggered via the event bound in subscribe
  getValue: function(el) {
    // Select the checkbox objects that have name equal to the grouping div's id
    var $objs = $('input[name="' + $escape4but(el.id) + '"]');

    var values = new Array($objs.length);
    for (var i = 0; i < $objs.length; i++) {
      values += $objs[i].value + '/';
    }

    values = values.replace(/(^[,\s]+)|([,\s]+$)/g, '');
    return values.substring(0, values.length - 1);
  },

  setValue: function(el, value) {
    el.value = value;
  },
  subscribe: function(el, callback) {
    $(el).on('keyup.date_binding input.date_binding', function(event) {
      callback(true);
    });
    $(el).on('change.date_binding', function(event) {
      callback(false);
    });
  },
  unsubscribe: function(el) {
    $(el).off('.date_binding');
  },


});

// register the binding so Shiny knows it exists
Shiny.inputBindings.register(date_binding);
