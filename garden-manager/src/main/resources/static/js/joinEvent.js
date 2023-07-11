$(document).ready(function() {
    
    $('tbody').on('click', '.join-event', function() {
        var button = $(this);
        var eventId = button.data('event-id');
        joinEvent(eventId, button);
    });

    $('tbody').on('click', '.cancel-event', function() {
        var button = $(this);
        var eventId = button.data('event-id');
        cancelEvent(eventId, button);
    });

    // Function to join an event
    function joinEvent(eventId, button) {
        $.ajax({
            type: 'GET',
            url: '/join-' + eventId,
            success: function(response) {
                // Handle the success response
                console.log('Successfully joined the event!');
                button.text('Joining | Cancel');
                button.removeClass('join-event');
                button.addClass('cancel-event');
            },
            error: function(xhr, status, error) {
                // Handle the error response
                console.log('Error joining the event: ' + error);
            }
        });
    }

    // Function to cancel an event
    function cancelEvent(eventId, button) {
        $.ajax({
            type: 'GET',
            url: '/cancel-' + eventId,
            success: function(response) {
                // Handle the success response
                console.log('Successfully canceled the event!');
                button.text('Join');
                button.removeClass('cancel-event');
                button.addClass('join-event');
            },
            error: function(xhr, status, error) {
                // Handle the error response
                console.log('Error canceling the event: ' + error);
            }
        });
    }
});
