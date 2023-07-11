<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Dashboard</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://kit.fontawesome.com/9de172fcd8.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js"></script>
<script src="/js/chatMessageCount.js"></script>
<script src="/js/index.js"></script>
<link rel="icon" type="image/x-icon" href="/imgs/logo/werungardens.png">

</head>
<body>

	<header  style="background-color: #245907" aria-label="Site Header" >
  	<div style="background-color: #245907" class="mx-auto flex h-16 max-w-screen-xl items-center gap-8 px-4 sm:px-6 lg:px-8">
  
	  	<a  href="/home"> <img style="height:40px" src="imgs/logo/werungardens.png" alt="PNG Image"> </a>
	  
	    <div class="flex flex-1 items-center justify-end md:justify-between">
	      <nav aria-label="Site Nav" class="hidden md:block">
		        <ul class="flex items-center gap-6 text-sm">
		          <li>
		            <a style="font-size: 18px; transition: all 0.3s ease;" class="text-yellow-600 font-large transition hover:text-yellow-400/75" href="/home" onmouseover="this.style.paddingLeft='8px';"
  						onmouseout="this.style.paddingLeft='0';">
		              Home
		            </a>
		          </li>
		
		          <li>
		            <a style="font-size: 18px; transition: all 0.3s ease;" class="text-yellow-600 font-medium transition hover:text-yellow-400/75" href="/garden-volunteer" onmouseover="this.style.paddingLeft='8px';"
  						onmouseout="this.style.paddingLeft='0';">
		              Volunteer
		            </a>
		          </li>
		
		          <li>
		            <a style="font-size: 18px; transition: all 0.3s ease;" class="text-yellow-600 font-medium transition hover:text-yellow-400/75" href="/manage-garden" onmouseover="this.style.paddingLeft='8px';"
  						onmouseout="this.style.paddingLeft='0';">
		              Start a Community
		            </a>
		          </li>
		
		          <li>
		            <a style="font-size: 18px; transition: all 0.3s ease;" class="text-yellow-600 font-medium transition hover:text-yellow-400/75" href="/about" onmouseover="this.style.paddingLeft='8px';"
  						onmouseout="this.style.paddingLeft='0';">
		              About Us
		            </a>
		          </li>
		
		          
		        </ul>
	      	</nav>
		
		
         
         
            <div class="flex items-center gap-4 relative">
			    <div class="sm:flex sm:gap-4">
			        <div class="relative">
			        <c:if test="${newMessageCount > 0}">
			        <div style="color: #ffffff;background-color: #de3131;border-radius: 50px; height: 24px; width: 24px; position: absolute; text-align: center; margin-left: 75px; "><span class="notification-count">${newMessageCount}</span></div>
			        </c:if>
			            <button class="block rounded-md px-4 py-2.5 text-md font-medium text-white transition" style="background-color: #e8921a" onmouseout="this.style.color='#f5e5c6'; this.style.backgroundColor='#e8921a';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';" onclick="toggleDropdown()">
			                Menu
			            </button>
			            <div id="dropdown-menu" class="absolute hidden right-0 bg-white rounded-md shadow-lg py-2.5 mt-1 w-40">
		<c:choose>
         
         <c:when test="${ManagerId.equals(ManagerId)}">
         <div >
        	
	          <a
	            class="block px-4 py-2 text-lg font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';"
	            href="/manager-dashboard"
	          >
	            Dashboard
	          </a>

        	
        	
        	<a class="block px-4 py-2 text-lg font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#e8921a';" href="/create-Event">Create Event</a>
			                
			<a class="block px-4 py-2 text-md font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';" href="/notifications">
    						Notifications <span class="notification-count">${newMessageCount}</span>
			</a>

      	
	         <a
	            class="block px-4 py-2 text-lg font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#e33d1b';"
	            href="/logout">
	            Logout
	          </a>

      	</div>
         </c:when>
         
         <c:when test="${VolunteerId.equals(VolunteerId)}">
         
        	
	          <a
	            class="block px-4 py-2 text-lg font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';"
	            href="/volunteer-dashboard"
	          >
	            Dashboard
	          </a>

        	
        	
        	<a class="block px-4 py-2 text-md font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';" href="/notifications">
    						Notifications <span class="notification-count">${newMessageCount}</span>
			</a>
  
        	
        	
	          <a
	            class="block px-4 py-2 text-lg font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#e33d1b';"
	            href="/logout">
	            Logout
	          </a>

        	

      	
         </c:when>
  
         <c:otherwise>
         
         <div class=" ">
	        <div class="">
	          <a
	            class="block px-4 py-2 text-lg font-medium text-gray-700" style="background-color: white" onmouseout="this.style.color='gray'; this.style.backgroundColor='white';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';"
	            href="/login"
	          >
	            Login
	          </a>
	
	          
	        </div>

      		</div>
		
            
         </c:otherwise>
      	</c:choose>
			                
							
			    	</div>
			    </div>
			  </div>
			</div>

        
    	</div>
  	</div>
	</header>
	
	<div class="container">
	
	<c:choose>
         
         <c:when test = "${not empty managersEventsList}">
         	<div class="mx-auto flex justify-between max-w-screen-xl  gap-8 px-4 sm:px-6 lg:px-8"> 
			<h1 style="font-weight: bold; font-size: 20px; margin-top: 15px; margin-bottom: 10px"> Welcome, <c:out value="${ManagerName}" /> </h1>
			
			
			</div>
		
		<h3 style="margin-top: 20px; margin-bottom: 10px; font-weight: bold; text-align: center; font-size: 30px"> My Events Calendar </h3>
		<hr style="width: 1000px; margin: 0 auto; margin-bottom: 20px">
		<div style="color: green; background-color: #ede9da; font-size: 15px; padding: 10px" id="calendar">
		
		</div>
		
	
	<h3 style="font-weight: bold; font-size: 30px; margin-bottom: 10px; margin-top: 40px; text-align: center"> Available Volunteers</h3>
			
			<table class="table table-hover" style="margin-left: 5px; background-color: #4e7b3d; color: white" onmouseout="this.style.backgroundColor='#4e7b3d';" >
			  <thead>
			    <tr>
			      <th scope="col">Name</th>
			      <th scope="col">Volunteer Type</th>
			      <th scope="col">Event Name</th>
			      <th scope="col">Contact</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			  
			  <c:forEach var="event" items="${eventsList}">
        
    			
      		<%-- <c:if test="${oneEvent.volunteers.contains()}"> --%>
  			<tr style="background-color: #4e7b3d; color: white" onmouseout="this.style.backgroundColor='#4e7b3d';" onmouseover="this.style.color='white'; this.style.backgroundColor='#e8921a';">
      		 <c:forEach var="volunteer" items="${event.volunteers}" > 
    		<td>
       		 ${volunteer.firstName}
      		<%-- </c:forEach> --%>
      		</td>
 
   		      <td>
       		 ${volunteer.volunteerType}
   		       </td>
   		       
   		       <td>${event.eventName} </td> 
   		       
   		       <td>
       		 ${volunteer.email}
   		       </td> 
   		      </c:forEach>  
  		   </tr>
<%--   		   </c:if>  --%>
			</c:forEach>

			    
			    
			  </tbody>
			</table>
			
			<h3 style="font-weight: bold; font-size: 30px; margin-bottom: 5px; margin-top: 40px; text-align: center">Upcoming Events In <c:out value="${Manager.location}" /> </h3>
			<h3 style="margin-top: 5px; margin-bottom: 10px; font-weight: bold; text-align: center; font-size: 20px"> (Click on an event to get more info.) </h3>
			<table class="table table-hover" style="margin-left: 5px; background-color: #e8921a; color: white" onmouseout="this.style.backgroundColor='#e8921a';">
			  <thead>
			  
			    <tr>
			      <th scope="col">Event Name</th>
			      <th scope="col">Event Host</th>
			      <th scope="col">Action</th>
			      <th scope="col">Volunteer Count </th>
			      
			      
			    </tr>
			  </thead>
			  <tbody>
			  
			  
			  
			    <c:forEach var="oneEvent" items="${eventsList}">
				  
				    <tr style="background-color: #e8921a; color: white" onmouseout="this.style.color='#ffffff'; this.style.backgroundColor='#e8921a';" onmouseover="this.style.color='#ffffff'; this.style.backgroundColor='#4e7b3d';">
				      <td><a href="/event-details-${oneEvent.id}">  <c:out value="${oneEvent.eventName}" /> </a></td>
				      <td><c:out value="${oneEvent.city}" /></td>
				      <c:choose>
				      <c:when test="${oneEvent.manager.id.equals(ManagerId)}">
				      <td>
				  		<form action="/deleteEvent-${oneEvent.id}" method="POST">
				  		<input type="hidden" name="_method" value="delete" />
				 		 <button style="background-color: #7b3d3d;" onmouseout="this.style.backgroundColor='#7b3d3d';" onmouseover="this.style.color='#ffffff'; this.style.backgroundColor='#de3131';" type="submit" class="btn btn-danger">Delete Event</button>
				  		</form> 
				  		</td>
  						</c:when>
  						<c:otherwise>
  						<td>Event Managed by: <c:out value="${oneEvent.manager.managerName}" /></td>
  						
  						</c:otherwise>
  						</c:choose>
  						<td>${oneEvent.volunteers.size()}</td>
  						
				    </tr>
				  
				</c:forEach>
	
			    
			  </tbody>
			</table>
           
         </c:when>
  
         <c:otherwise>
         
         <div class="mx-auto flex justify-between max-w-screen-xl  gap-8 px-4 sm:px-6 lg:px-8"> 
			<h1 style="font-weight: bold; font-size: 20px; margin-top: 15px; margin-bottom: 10px"> Welcome, <c:out value="${ManagerName}" /> </h1>
			
		</div>
		
		<h3 style="margin-top: 20px; margin-bottom: 10px; font-weight: bold; text-align: center; font-size: 30px"> (Create a new Event to unlock the Manager Abilities!) </h3>
         
			<h3 style="font-weight: bold; font-size: 20px; margin-bottom: 5px; margin-top: 40px; text-align: center"> Available Volunteers</h3>
			
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">Name</th>
			      <th scope="col">Volunteer Type</th>
			      <th scope="col">Contact</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			  
			  <tr>
			      <td>Name</td>
			      <td>Volunteer Type</td>
			      <td>Contact</td>
			      
			    </tr>
			  
			    
			  </tbody>
			</table>
			
			<h3 style="font-weight: bold; font-size: 20px; margin-bottom: 5px; margin-top: 40px; text-align: center">Upcoming Events In <c:out value="${Manager.location}" /> </h3>
			<table class="table table-hover">
			  <thead>
			  
			    <tr>
			      <th scope="col">Event Name</th>
			      <th scope="col">City</th>
			      <th scope="col">Action</th>
			      
			      
			    </tr>
			  </thead>
			  <tbody>
			  
			  
			    <c:forEach var="oneEvent" items="${eventsList}">
				  
				    <tr>
				      <td><a href="/event-details-${oneEvent.id}">  <c:out value="${oneEvent.eventName}" /> </a></td>
				      <td><c:out value="${oneEvent.city}" /></td>
				       <c:choose>
				      <c:when test="${oneEvent.manager.id.equals(ManagerId)}">
				      <td>
				  		<form action="/deleteEvent-${oneEvent.id}" method="POST">
				  		<input type="hidden" name="_method" value="delete" />
				 		 <button style="background-color: #7b3d3d;" onmouseout="this.style.backgroundColor='#7b3d3d';" onmouseover="this.style.color='#ffffff'; this.style.backgroundColor='#de3131';" type="submit" class="btn btn-danger">Delete Event</button>
				  		</form> 
				  		</td>
  						</c:when>
  						<c:otherwise>
  						<td>Event Managed by: <c:out value="${oneEvent.manager.managerName}" /></td>
  						
  						</c:otherwise>
  						</c:choose>
				    </tr>
				  
				</c:forEach>
			     
		      
			  
			  
			    
			    
			  </tbody>
			</table>
            
         </c:otherwise>
      </c:choose>


	</div>
	
<!-- Footer -->
 <footer class="footer">
  	 <div style="margin: 0 auto; width: 100%" class="footerContainer">
  	 	<div class="row">
  	 		<div class="footer-col">
  	 			<h4>company</h4>
  	 			<ul>
  	 				<li><a href="/about">about us</a></li>
  	 				<li><a href="#">our services</a></li>
  	 				<li><a href="#">privacy policy</a></li>
  	 				<li><a href="#">donate</a></li>
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>get help</h4>
  	 			<ul>
  	 				<li><a href="#">FAQ</a></li>
  	 				
  	 				<li><a href="#">legal notices</a></li>
  	 				
  	 			</ul>
  	 		</div>
  	 		
  	 		<div class="footer-col">
  	 			<h4>follow us</h4>
  	 			<div class="social-links">
  	 				<a href="#"><i class="fab fa-facebook-f"></i></a>
  	 				<a href="#"><i class="fab fa-twitter"></i></a>
  	 				<a href="#"><i class="fab fa-instagram"></i></a>
  	 				<a href="#"><i class="fab fa-linkedin-in"></i></a>
  	 			</div>
  	 		</div>
  	 	</div>
  	 </div>
  </footer>
	
	<script>
  $(document).ready(function() {
    // Function to fetch events data from the server and populate the calendar
    function fetchAndPopulateEvents(start, end, timezone, callback) {
      $.ajax({
        url: '/events', // URL to fetch events data from the server
        type: 'GET',
        dataType: 'json',
        data: {
          start: start.format(),
          end: end.format()
        },
        
        success: function(data) {
          // Process the received data and populate the calendar with events
          //console.log(data);
          var events = [];
          if (data && data.length) {
            data.forEach(function(event) {
              // Process each event object and convert it to the format expected by the calendar
              var start = new Date(event.start); // Convert start date to JavaScript Date object
              var end = new Date(event.end); // Convert end date to JavaScript Date object

              // Format the dates in the desired format accepted by FullCalendar
              var formattedStart = start.toISOString(); // Format start date to ISO 8601
              var formattedEnd = end.toISOString(); // Format end date to ISO 8601

              var calendarEvent = {
                title: event.title,
                start: formattedStart,
                end: formattedEnd,
                
              };

              events.push(calendarEvent);
            });
          }
          // Populate the calendar with the events
          callback(events);
        },
        error: function() {
          // Handle error case
          alert('Error fetching events data.');
        }
      });
    }
		
    // Initialize the FullCalendar with initial options
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month'
      },
      
      eventSources: [
        {
          events: fetchAndPopulateEvents, // Pass the function reference as the events source
          color: 'orange', // Set the background color for all events
          textColor: 'white', // Set the text color for all events 
          eventRender: function(event, element) {
            element.find('.fc-title').text(event.title); // Set the event title
          }
        }
      ],
      
      eventClick: function(event) {
        alert('Event: ' + event.title + '\nLocation: ' + event.location);
      }
    });

    // Fetch and populate events when the page loads
     fetchAndPopulateEvents(
      $('#calendar').fullCalendar('getView').start,
      $('#calendar').fullCalendar('getView').end,
      $('#calendar').fullCalendar('getView').timezone,
      // function(events) {
       // $('#calendar').fullCalendar('renderEvents', events, true);
     // }
    );
  });
</script>

	
</body>
</html>