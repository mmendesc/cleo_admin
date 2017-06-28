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

  $('#timepicker-start-work').timepicker({
    defaultTime: 'value',
    showInputs: false,
    minuteStep: 5,
    showSeconds: false,
    showMeridian: false,
    pickDate: false,
    disableFocus:false,
    explicitMode:true
  });

  $('#timepicker-end-work').timepicker({
    defaultTime: 'value',
    showInputs: false,
    minuteStep: 5,
    showSeconds: false,
    showMeridian: false,
    pickDate: false,
    disableFocus:false,
    explicitMode:true
  });

  $('#timepicker-start-interval').timepicker({
    defaultTime: 'value',
    showInputs: false,
    minuteStep: 5,
    showSeconds: false,
    showMeridian: false,
    pickDate: false,
    disableFocus:false,
    explicitMode:true
  });

  $('#timepicker-end-interval').timepicker({
    defaultTime: 'value',
    showInputs: false,
    minuteStep: 5,
    showSeconds: false,
    showMeridian: false,
    pickDate: false,
    disableFocus:false,
    explicitMode:true
  });

  $('.date-picker').datepicker();

});
