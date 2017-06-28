$(document).on('turbolinks:load',function() {
  var counter = 0;
  $('#plusIntervalos').click(function(){
      counter++;
      e = $('#add_interval').clone();
      e.show();
      timepickers = e.find('input.timepicker');
      timepickers.first().attr('name',"employee[contract_attributes][intervals_attributes]["+ counter +"][start_time]");
      timepickers.last().attr('name',"employee[contract_attributes][intervals_attributes]["+ counter +"][end_time]");
      timepickers.each(function (){
        $(this).timepicker({
          defaultTime: 'value',
          showInputs: false,
          minuteStep: 5,
          showSeconds: false,
          showMeridian: false,
          pickDate: false,
          disableFocus:false,
          explicitMode:true
        });
      })
      console.log(e.find('.timepicker').first().attr('name'));
      $('.tw').append(e);
    });

});
