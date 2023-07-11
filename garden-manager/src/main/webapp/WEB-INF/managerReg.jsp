<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage A Garden</title>
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
	
			<h3 style="font-weight: bold; margin: 0 auto; font-size: 30px; width: 800px; margin-top: 50px; margin-bottom: 10px;"> The Importance of Starting a Community Garden: Reconnecting with Nature and Sustainable Food Production. </h3>
			<hr style="width: 1000px; margin: 0 auto; margin-bottom: 20px">
			<p style="margin-bottom: 20px; font-size: 20px "> In today's modern society, many people have become disconnected from nature, 
			relying heavily on industrialized food systems. However, with the increasing concern for the 
			environment and sustainable living, it is crucial to rediscover the lost art of growing our own food. 
			Community gardens offer a transformative solution, enabling individuals to reconnect with nature, 
			foster community bonds, and promote sustainable food production. Let's delve into the significance 
			of starting a community garden in a society where people have lost touch with nature and 
			lack knowledge about growing their own food. </p>
			
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 1. Reconnecting with Nature: </h4>
			<img style="width: 630px" src="imgs/gardening_imgs/group-people-gardening-backyard-together_53876-72457.jpg" alt="People working in community Garden.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> In our fast-paced urban lifestyles, we often forget the benefits of immersing ourselves in nature. 
			Community gardens provide a unique opportunity for individuals to reconnect with the earth, 
			cultivating plants, and witnessing the wonders of growth. By engaging in hands-on gardening activities, 
			people can experience the therapeutic benefits of being in nature, reduce stress, and improve their overall well-being. 
			It's a chance to escape the concrete jungle and embrace the tranquility of green spaces. </p>
			
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 2. Sustainable Food Production: </h4>
			<img src="imgs/gardening_imgs/freshly-grown-by-nature-crate-full-fresh-produce-vegetables-from-farm-ai-generative_136403-16688.jpg" alt="Fresh vegetables and fruit from community Garden.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Industrialized agriculture has led to unsustainable farming practices, depleting natural resources and contributing 
			to environmental degradation. Community gardens offer an alternative model, promoting sustainable food production. 
			By growing food locally, community gardeners reduce the carbon footprint associated with transportation and minimize 
			the use of harmful pesticides and synthetic fertilizers. Fresh, organic produce from community gardens not only 
			improves the health of individuals but also contributes to the overall ecological balance. </p>
			
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 3. Sharing Knowledge and Skills: </h4>
			<img src="imgs/gardening_imgs/group-people-planting-vegetables_53876-84401.jpg" alt="Community Garden members exchanging gardening tips and techniques.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> One of the significant advantages of community gardens is the exchange of knowledge and skills among participants. 
			In a society where many have lost touch with agriculture and food production, community gardens become learning hubs. 
			Individuals of all ages and backgrounds come together to share their expertise, gardening techniques, and traditional wisdom. 
			By creating a supportive and collaborative environment, community gardens empower individuals with the knowledge and skills
			 to grow their own food, fostering self-sufficiency and resilience. </p>
			 
			 <h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 4. Building Community Bonds: </h4>
			<img src="imgs/gardening_imgs/medium-shot-smiley-people-with-skewers_23-2149412458.jpg" alt="Community Garden gathering.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> In an increasingly disconnected world, community gardens serve as catalysts for building strong bonds and social cohesion. 
			People from diverse backgrounds unite around a shared purpose, cultivating friendships and fostering a sense of belonging. 
			Community gardens become spaces for community events, workshops, and celebrations, strengthening the social fabric of neighborhoods. 
			Through collective efforts, individuals develop a deeper appreciation for the environment and a stronger commitment to sustainable practices. </p>
			
			<img style="margin: 0 auto; margin-top: 30px;" src="imgs/manager_imgs/Community Garden 2.png" alt="Vibrant Community Garden.">
			<p style="margin-bottom: 30px; margin-top: 20px;font-size: 15px; text-align: center; font-weight: bold"> Starting a community garden is a powerful step towards reconnecting with nature, promoting sustainable food production, and building resilient communities. 
			In a society where people have lost touch with nature and lack knowledge about growing their own food, community gardens provide a platform for individuals to 
			rediscover their connection to the earth, share skills, and foster a sense of community. By embracing the importance of community gardens, we can pave the way 
			for a more sustainable and harmonious future, where individuals thrive in harmony with nature and live off the planet with greater self-sufficiency. </p>
			
			
			 <h1 style="font-weight: bold; font-size: 30px; text-align: center; margin-bottom: 20px; margin-top: 10px; color: green"> Start a community Garden! </h1>
			<div class="formContainer">
				<form:form class="form-control" method="POST" modelAttribute="newManager" action="/manage-garden">
					
						
						<h4>
						<form:label path="communityName" class="form-label">Community Name: </form:label>
						<form:input type="text" path="communityName" class="form-control" />
						<form:errors path="communityName" class="text-danger"/>
						</h4>
						
						<h4>
						<form:label path="location" class="form-label">Location: </form:label>
						<form:input type="text" path="location" class="form-control" />
						<form:errors path="location" class="text-danger"/>
						</h4>
						
						<h4>
						<form:label path="managerName" class="form-label">Manager Name: </form:label>
						<form:input type="text" path="managerName" class="form-control"/>
						<form:errors path="managerName" class="text-danger"/>
						</h4>
						
						<h4>
						<form:label path="email" class="form-label">Email: </form:label>
						<form:input type="text" path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
						</h4>
						
						<h4>
						<form:label path="phoneNumber" class="form-label">Phone Number: </form:label>
						<form:input type="text" path="phoneNumber" class="form-control"/>
						<form:errors path="phoneNumber" class="text-danger"/>
						</h4>
						
						
						<h4>
						<form:label path="password" class="form-label">Password: </form:label>
						<form:input type="password" path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
						</h4>
						
						
						<h4>
			                <form:label path="confirm" class="">Confirm PW:</form:label>
			                <form:input type="password" path="confirm" class="form-control" />
			                <form:errors path="confirm" class="text-danger"/>
			            </h4>
						
						
						<button type="submit" class="btn btn-primary" style="margin-top: 10px; margin-left: 300px; color: #525252; hover: color: white"onmouseover="this.style.color='white';" onmouseout="this.style.color='#525252';">Submit</button>
					
					</form:form>
			</div>
			 
		
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
	

</body>
</html>