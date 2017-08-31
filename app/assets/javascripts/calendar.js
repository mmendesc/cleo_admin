$(document).on('turbolinks:load',function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        eventSources: '/appointments.json',
        eventRender: function(event, element) {
            element.attr('id','classe1');
            element.append( "<span class='closeon'>X</span>" );
            element.find(".closeon").click(function() {
                if (confirm('Apagar?')){
                    $('#calendar').fullCalendar('removeEvents',event._id);
                    $.ajax({
                        url: '/appointments/'+ event.id,
                        type: 'delete',
                        data: { id: event.id}
                    });
                }
            });

        },
        timeFormat: 'H(:mm)'
    })

});
