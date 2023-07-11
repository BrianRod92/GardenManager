/**
 * 
 */
 $(document).ready(function() {
    // Fetch the manager's new message count from the server
    function fetchNewMessageCount() {
        $.ajax({
            url: '/new-message-count', // URL to fetch the new message count
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                // Update the notification count on the page
                $('.notification-count').text(data.newMessageCount);
            },
            error: function() {
                // Handle error case
                console.log('Error fetching new message count.');
            }
        });
    }
    
    // Call the fetchNewMessageCount function when the page loads
    fetchNewMessageCount();
    
    // Refresh the new message count every few seconds
    setInterval(fetchNewMessageCount, 10000);
    
    // Handle click event on Notifications link
  $('a[href^="/notifications"]').on('click', function(e) {
    e.preventDefault(); // Prevent default link behavior

    // Redirect to the notifications page
    window.location.href = '/notifications';
  });
});
