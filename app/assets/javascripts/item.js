$(document).on('turbolinks:load',function() {
  var counter = 0;

  $('#add_item').click(function(){
    counter++;
    e = $('#new_item').clone();
    e.find('select').attr('name',"sale[items_attributes]["+ counter +"][product_id]");
    e.find('input').first().attr('name', "sale[items_attributes]["+ counter +"][quantity]");
    e.find('input').last().attr('name',"sale[items_attributes]["+ counter +"][discount]");
    e.show();


    $('.items').append(e);
  });

});
