$(document).on('turbolinks:load',function() {


  $('#startHoras0').timepicker({
      //autoclose: true,
      defaultTime: 'value',
      showInputs: false,
      minuteStep: 5,
      showSeconds: false,
      showMeridian: false,
      pickDate: false,
      disableFocus:false,
      explicitMode:true
  });

  $('#timepicker1').timepicker({
    defaultTime: 'value',
    showInputs: false,
    minuteStep: 5,
    showSeconds: false,
    showMeridian: false,
    pickDate: false,
    disableFocus:false,
    explicitMode:true
  });
});
