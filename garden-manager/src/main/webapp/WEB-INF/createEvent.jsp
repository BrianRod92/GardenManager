<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Event</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://kit.fontawesome.com/9de172fcd8.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script src="/js/chatMessageCount.js"></script>
<script src="/js/index.js"></script>
<link rel="icon" type="image/x-icon" href="/imgs/logo/werungardens.png">
</head>
<body>

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
	
	<img style="width: 800px; margin: 0 auto; margin-top: 50px; margin-bottom: 40px " src="/imgs/gardening_imgs/group-people-gardening-backyard-together_53876-53853.jpg" alt="Community Garden Event.">
	
	<h2 style="margin-top: 30px; margin-bottom: 20px; text-align: center; font-size: 30px; font-weight: bold">Create an Event</h2>
	<hr style="width: 500px; margin: 0 auto; margin-bottom: 20px">
		<div style="width:500px; background-color:#ede9da; padding:10px; margin: 0 auto; margin-bottom: 50px">
	
		<form:form method="POST" modelAttribute="newEvent" action="/create-Event">
		
			<form:hidden path="manager" value="${ManagerId}" />
			<h4>
			<form:label path="eventName" class="form-label">Event Name: </form:label>
			<form:input type="text" path="eventName" class="form-control" />
			<form:errors path="eventName" />
			</h4>
			
			<h4>
			<form:label path="address" class="form-label">Address: </form:label>
			<form:input type="text" path="address" class="form-control" />
			<form:errors path="address" />
			</h4>
			
			<h4>
			<form:label path="city" class="form-label">City: </form:label>
			<form:input type="text" path="city" class="form-control" />
			<form:errors path="city" />
			</h4>
			
			<h4>
			<form:label path="zipCode" class="form-label">ZipCode: </form:label>
			<form:input type="number" path="zipCode" class="form-control" />
			<form:errors path="zipCode" />
			</h4>
			
			<h4>
			<form:label path="start" class="form-label">Start Date: </form:label>
			<form:input type="date" path="start" class="form-control" />
			<form:errors path="start" />
			</h4>
			
			<h4>
			<form:label path="end" class="form-label">End Date: </form:label>
			<form:input type="date" path="end" class="form-control" />
			<form:errors path="end" />
			</h4>
			
			<h4>
				<label class="form-label">Time: </label>
				<form:select path="time" id="time" name="time" class="form-select" >
					
				<option value="">Select</option>
				
					
				</form:select>
			</h4>
			
			<h4>
			<form:label path="details" class="form-label">Event Details: </form:label>
			<form:textarea path="details" class="form-control"></form:textarea>
			<form:errors path="details" />
			</h4>
			
			
			
			
			
			<button style="margin-top: 10px; margin-left: 390px; font-weight: bold" type="submit" class="btn btn-success">Submit</button>
		
		</form:form>
		
		</div>
		<hr style="width: 1000px; margin-left: 300px; margin-bottom: 20px">
		<h2 style="width: 800px; font-weight: bold; margin-left: 430px; font-size: 20px; color: #1b1f0f"> Gardening managers can host various events to engage and encourage volunteers to participate in gardening activities. <br> Here are some important events gardening managers can consider hosting:</h2>
		<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; ">Garden Workshops or Training Sessions: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/IMG3568-91f7148.jpg" alt="Volunteers attending an event.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Organize workshops or training sessions to educate volunteers about gardening techniques, plant care, composting, or sustainable gardening practices. <br>
			- Provide hands-on demonstrations and interactive sessions to enhance volunteers' gardening skills and knowledge. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Planting Days: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/kids-planting-in-garden.jpg" alt="Volunteers planting at an event.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Host planting events where volunteers come together to plant seedlings, trees, or flowers in designated garden areas.
				<br> - Provide guidance on proper planting techniques and assign tasks to ensure efficient teamwork. </p>
			</div>
			
		</div>
		
		<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; ">Garden Clean-up and Maintenance Days: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/volunteers-helping-clean-up.jpg" alt="Volunteers helping clean up.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Arrange scheduled clean-up and maintenance days where volunteers help weed, mulch, prune, and tidy up the garden. <br>
			- Assign specific areas or tasks to ensure a systematic approach and effective utilization of volunteer efforts. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Harvest Festivals: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/CitySchoolyard-Garden-5.jpg" alt="Harvest Festival event.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Plan harvest festivals to celebrate the bounty of the garden.
				<br> - Involve volunteers in harvesting crops, arranging displays of harvested produce, and organizing activities like cooking demonstrations or food tasting using garden-fresh ingredients. </p>
			</div>
			
		</div>
		
		<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; ">Community Garden Open Days: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/Group-of-kids-gardening-may23.jpg" alt="Community Garden Open Day for Volunteers.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Host open days for the community to visit and explore the garden. <br>
			- Allow volunteers to showcase their gardening achievements and share their experiences with visitors. <br> - Provide guided tours, informational displays, or gardening-related activities for all ages. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Garden Beautification Projects: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/034 - farm_visit_17_of_59_lead.jpg" alt="Garden Beautification.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Organize projects aimed at enhancing the aesthetic appeal of the garden.
				<br> - Engage volunteers in activities such as creating decorative garden features, installing artwork, or designing themed garden sections. </p>
			</div>
			
		</div>
		
		<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; ">Seed Swaps or Plant Exchanges: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/Plant swap.jpg" alt="Community Garden Seed Swaps.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Arrange events where volunteers can exchange seeds, plants, or cuttings. <br>
			- Encourage participants to share their favorite varieties, promote biodiversity, and foster community connections. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Gardening Competitions or Challenges: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/Challenges-of-a-Community-Garden.jpg" alt="Gardening Competition.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Host friendly gardening competitions or challenges to inspire volunteers and promote a sense of camaraderie.
				<br> - Set goals or categories such as best vegetable garden, most colorful flower bed, or creative container gardening. </p>
			</div>
			
		</div>
		
		<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; ">Garden Tours or Demonstrations: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/Garden-tour.jpg" alt="Garden Tour.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Organize guided garden tours or demonstrations to showcase different gardening techniques, designs, or specialized areas within the garden. <br>
			- Invite volunteers to participate as tour guides or demonstrators, sharing their expertise and experiences. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Volunteer Appreciation Events: </h4>
			<img style="width: 500px" src="/imgs/events_imgs/Dattnew-Architects-volunteer-at-Marcy-Hart-in-2020.jpg" alt="Volunteer Appreciation Event.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> - Host special events to express gratitude and recognize the efforts of volunteers.
				<br> - Organize social gatherings, appreciation dinners, or award ceremonies to acknowledge their contributions and build a sense of community. </p>
			</div>
			
		</div>
		<h2 style="width: 800px; text-align: center; margin-top:40px; font-size: 20px; color: #1b1f0f"> Remember to communicate and promote these events effectively, involving local communities, schools, or gardening enthusiasts to maximize participation and create a vibrant gardening culture.</h2>
		<a style="margin-left: 540px;" href="https://edit.org/blog/editable-garden-center-gardening-flyers"><img style="width: 500px; margin: 0 auto" src="/imgs/events_imgs/a74-garden-center-flyers-templates-editable-online-free.jpg" alt="Event flyer templates."></a>
		<!-- <a style="margin: 10px auto; margin-bottom: 60px" href="https://edit.org/blog/editable-garden-center-gardening-flyers">Editable garden flyers</a> -->
		
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
  var timeSelect = document.getElementById('time');

  // Generate time options dynamically using JavaScript
  for (var hour = 1; hour <= 12; hour++) {
    for (var minute = 0; minute <= 30; minute += 30) {
      var formattedHour = ('0' + hour).slice(-2); // Add leading zero if needed
      var formattedMinute = ('0' + minute).slice(-2); // Add leading zero if needed
      var optionValue = formattedHour + ':' + formattedMinute;
      var optionText = formattedHour + ':' + formattedMinute;

      var option = new Option(optionText, optionValue);
      timeSelect.appendChild(option);
    }
  }
	</script>
</body>
</html>