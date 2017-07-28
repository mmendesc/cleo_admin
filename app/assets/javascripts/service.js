$(document).on('turbolinks:load',function() {
  var counter = 0;

  $('#add_service').click(function(){
    counter++;
    e = $('#new_service').clone();
    e.find('select').attr('name',"employee[abilities_attributes]["+ counter +"][service_id]");
    e.find('input').attr('name', "employee[abilities_attributes]["+ counter +"][commission]");
    e.show();


    $('.services').append(e);
  });

});
