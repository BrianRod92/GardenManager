<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://kit.fontawesome.com/9de172fcd8.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/chatMessageCount.js"></script>
<link rel="icon" type="image/x-icon" href="/imgs/logo/werungardens.png">

</head>
<body style="background-color: #f1f1f1">

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
		 <h2 style="font-weight: bold; font-size: 30px; text-align: center; margin-top: 20px">Event Details</h2>
    <!-- Display event details here -->
    <h3 style="text-align: center; font-size: 20px; margin-top: 10px">Event Name: <span style="font-weight: bold">${event.eventName}</span></h3>
    <fmt:formatDate value="${event.start}" pattern="MM-dd-yyyy" var="formattedDate" />
	<h3 style="text-align: center; font-size: 20px">Event Date: <span style="font-weight: bold">${formattedDate}</span></h3>
	<h3 style="text-align: center; font-size: 20px">Start Time: <span style="font-weight: bold"> ${event.time} </span> </h3>
	<h3 style="text-align: center; font-size: 20px">Event Host: <span style="font-weight: bold"> ${event.manager.managerName}</span> </h3>
    <h3 style="text-align: center; font-size: 20px">Address: <span style="font-weight: bold"> ${event.address}</span> </h3>
	<h3 style="text-align: center; font-size: 20px">City: <span style="font-weight: bold"> ${event.city}</span> </h3>
    <h3 style="text-align: center; font-size: 20px">ZipCode: <span style="font-weight: bold"> ${event.zipCode}</span> </h3>
	<h3 style="text-align: center; font-size: 20px">Event Details: <span style="font-weight: bold"> ${event.details}</span> </h3>
	
	
         
         
     <c:if test="${event.manager.id.equals(ManagerId)}">
  		<form action="/deleteEvent-${event.id}" method="POST">
  		<input type="hidden" name="_method" value="delete" />
 		 <button style="margin-left: 700px; margin-top: 10px; background-color: #7b3d3d;" onmouseout="this.style.backgroundColor='#7b3d3d';" onmouseover="this.style.color='#ffffff'; this.style.backgroundColor='#de3131';" type="submit" class="btn btn-danger">Delete Event</button>
  		</form> 
  	</c:if>
         
	
	<div style="display: flex; align-items: center; justify-content: space-evenly; margin-top: 60px">
	<img style="height: 400px; border-radius: 50px " src="/imgs/gardening_imgs/ann-b7ooyxpub4A-unsplash.jpg" alt="Gardening Quote.">
	
    <!-- Chat message area Here -->
    <div>
  <h3 style="font-weight: bold; font-size: 20px; margin-left: 390px; margin-bottom: 10px ">Event Chat Messages</h3>
    <div id="chat-messages" class="message-area">
  <c:choose>
    <c:when test="${ManagerId != null && VolunteerId == null}">
      <div class="message-list">
        <!-- Iterate over the chat messages and display them -->
        <c:forEach items="${messageList}" var="message">
          <div class="message">
            <span style="margin-right: 5px">
              <fmt:formatDate value="${message.createdAt}" pattern="hh:mm a" />
            </span>
            <p class="${message.manager.id == manager.id ? 'blue' : 'green'}">
              ${message.sender.firstName} ${message.manager.managerName}: ${message.message}
            </p>
          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:when test="${VolunteerId != null && ManagerId == null}">
      <div class="message-list">
        <!-- Iterate over the chat messages and display them -->
        <c:forEach items="${messageList}" var="message">
          <div class="message">
            <span style="margin-right: 5px">
              <fmt:formatDate value="${message.createdAt}" pattern="hh:mm a" />
            </span>
            <p  class="${message.sender.id == volunteer.id ? 'green' : 'blue'}">
              ${message.manager.managerName} ${message.sender.firstName}: ${message.message}
            </p>
          </div>
        </c:forEach>
      </div>
    </c:when>
  </c:choose>
</div>



    
    <form:form action="/create-Message" method="post" modelAttribute="newMessage">
        <div class="form-group">
         
	    	 
	    	<form:hidden path="event" value="${event.id}"/> 
	    	<c:choose>
                <c:when test="${ManagerId != null && VolunteerId == null}">
                    <form:hidden path="manager" value="${manager.id}"/>
                    <form:hidden path="hasNewMessages" value="true"/>
                    <c:if test="${event.manager.id.equals(ManagerId)}">
                    <div style="align-items: center; display: flex; margin-left: 235px; background-color: #f1f1f1; padding: 10px; width: 500px; border-radius: 10px; margin-top: 10px">
                        <form:input style="width: 400px; height: 50px;  margin-left: 10px" path="message" type="text" class="form-control"/>
                        <button style="height: 50px; margin-left:7px; color: #f5e5c6; background-color: #4e7b3d; " onmouseout="this.style.color='#f5e5c6'; this.style.backgroundColor='#4e7b3d';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';"  type="submit"
                                class="btn btn-primary text-Blue">Send
                        </button>
                    </div>
                    </c:if>
                </c:when>
                <c:when test="${VolunteerId != null && ManagerId == null}">
                    <form:hidden path="sender" value="${volunteer.id}"/>
                    <form:hidden path="hasNewMessages" value="true"/>
                    <div style="align-items: center; display: flex; margin-left: 235px; background-color: #f1f1f1; padding: 10px; width: 500px; border-radius: 10px; margin-top: 10px">
                        <form:input style="width: 400px; height: 50px;  margin-left: 10px" path="message" type="text" class="form-control"/>
                        <button style="height: 50px; margin-left:7px; color: #f5e5c6; background-color: #4e7b3d; " onmouseout="this.style.color='#f5e5c6'; this.style.backgroundColor='#4e7b3d';" onmouseover="this.style.color='#fff5e3'; this.style.backgroundColor='#5d9448';"  type="submit"
                                class="btn btn-primary text-Blue">Send
                        </button>
                    </div>
                </c:when>
            </c:choose>
        </div>
        
    </form:form>
    </div>
    </div>
    <h3 style="text-align: center; margin-top: 100px; font-weight: bold; font-size: 25px; margin-bottom: 10px">Gear Up for Gardening: Essential Gear for Volunteers!</h3>
    <img style="width: 700px; margin-top: 20px; margin: 0 auto; margin-bottom: 10px " src="/imgs/gardening_imgs/anxious-pretty-caucasian-female-gardener-wearing-gardening-hat-gloves-holding-spade-front-face-isolated-orange-wall-with-copy-space_1.jpg" alt="Woman in gardening gear.">
    <p style="width: 800px; text-align: center; font-size: 25px; margin-top: 10px; margin: 0 auto">Gardening is not just a delightful hobby; 
    it's also a rewarding way to connect with nature and contribute to a greener world. 
    If you're a new volunteer eager to dig your hands into the soil, 
    we've got you covered! In this post, we'll guide you through the must-have 
    gardening gear that ensures both your safety and productivity.
     So, grab your gloves and get ready to explore the wonderful world of gardening!</p>
     <img style="margin-top: 40px; height: 400px " src="/imgs/gardening_imgs/collection-gardening-boots-tools_23-2148028896.jpg" alt="Gardening boots.">
     <p> <span style="font-weight: bold; font-size: 20px">Sturdy Boots:</span> Taking the first step towards gardening means finding the right footwear. Invest in a pair of sturdy, waterproof boots that provide excellent traction and ankle support.
      Remember, your feet will be your reliable companions as you navigate through uneven terrain and tackle muddy paths. Plus, a little dirt on your boots is a badge of honor!</p>
      
      <img style="margin-top: 40px; height: 400px " src="/imgs/gardening_imgs/portrait-female-farmer-working-her-greenhouse_23-2149072095.jpg" alt="Woman wearing Gardening hat.">
     <p> <span style="font-weight: bold; font-size: 20px">Head Gear:</span> Gardening is all about getting closer to nature, but sometimes nature gets a little too close for comfort. Protect your head from pesky branches, unruly vines, 
     and unexpected surprises from above with a trusty hat or a lightweight helmet. Not only will it shield you from unwanted encounters, but it also adds a dash of style to your gardening ensemble!</p>
     
     
     <img style="margin-top: 40px; width: 600px " src="/imgs/gardening_imgs/smiling-young-caucasian-male-gardener-wearing-gardening-hat-gloves-holding-spade-shoulder-isolated-orange-wall-with-copy-space_141793.jpg" alt="Man holding gardening shovel.">
     <p> <span style="font-weight: bold; font-size: 20px">Reliable Tools: </span> Equip yourself with a basic set of essential gardening tools. A sturdy shovel, a versatile hand trowel, and a durable pruner will become your best buddies.
      Opt for ergonomic designs that reduce strain on your hands and wrists, ensuring a comfortable and efficient gardening experience. Remember, happy tools make for happy gardeners!</p>
     
     <img style="margin-top: 40px; height: 400px " src="/imgs/gardening_imgs/gardening-gloves-tools-harvested-dill-turnip-hanging-rope-with-clothespin-against-wooden-wall_23-2148181209.jpg" alt="Gloves hanging on rope.">
     <p> <span style="font-weight: bold; font-size: 20px">Hand Protection:</span> Your hands are the heroes of gardening, so they deserve some TLC. Invest in a pair of high-quality gardening gloves that strike the perfect balance 
     between dexterity and protection. Look for gloves made of breathable materials, with reinforced fingertips to shield you from thorns, prickles, and blisters. Happy hands mean happy gardening!</p>
     
     <img style="margin-top: 40px; height: 626px " src="/imgs/gardening_imgs/gardener-gardner-flower-gardening-garden-occupation-full-body-portrait-isolated-white_770123-2264.jpg" alt="Man wearing Apron.">
     <p> <span style="font-weight: bold; font-size: 20px">Apron:</span> Embrace your inner gardener fashionista with a sturdy and stylish apron. Not only will it keep your clothes clean from dirt and stains, but it will also 
     provide convenient pockets to hold your gardening essentials. From seed packets to gardening shears, your apron will be your handy storage solution, making you the envy of all your gardening buddies!</p>
     
     <img style="width: 700px; margin-top: 20px; margin: 0 auto; margin-bottom: 10px " src="/imgs/gardening_imgs/david-clode-eL4ADAsiOR8-unsplash.jpg" alt="Community Garden Sign.">
    <p style="width: 800px; text-align: center; font-size: 25px; margin-top: 10px; margin: 0 auto; margin-bottom: 50px">Congratulations, budding gardener! 
    Armed with these essential gardening gear recommendations, you're well-prepared to embark on your gardening journey. 
    Remember to prioritize safety, productivity, and a touch of style as you dig, plant, and nurture your garden. 
    So, slip into those boots, don your head gear, grab your tools and gloves, and tie that apron with pride. 
    Happy gardening, and may your green thumb flourish!</p>
     
     
     
     
     
</div>
	
<!-- Footer -->
 <footer class="footer">
  	 <div >
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

</body>
</html>