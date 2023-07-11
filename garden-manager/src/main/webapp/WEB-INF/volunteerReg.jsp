<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Volunteer for a Garden</title>
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
	
			<h3 style="font-weight: bold; margin-bottom: 10px; margin: 0 auto; margin-top: 50px; font-size: 30px; width: 650px"> The Power of Volunteering: Cultivating Community Gardens for a Sustainable Future. </h3>
			<hr style="width: 1000px; margin: 0 auto; margin-bottom: 20px; margin-top: 20px">
			<p style="margin-bottom: 20px; font-size: 20px "> In an era where sustainability and community engagement are paramount, volunteering in community gardens emerges as a transformative force. 
			People dedicating their time and effort to these green spaces play a crucial role in nurturing sustainable environments, 
			fostering local food production, and building vibrant communities. Let's delve into the significance of people volunteering 
			in community gardens and the positive impact it brings to our society. </p>
			
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 1. Building Stronger Communities: </h4>
			<img style="width: 630px" src="imgs/gardening_imgs/environmental-organization-low-angle-vigorous-three-volunteers-planting-tree-grinning_259150-30562.jpg" alt="Volunteers working together in a community garden, fostering camaraderie and teamwork.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Volunteering in community gardens creates a shared sense of purpose and strengthens community bonds. 
			People from diverse backgrounds come together, fostering connections and friendships while working towards a common goal. 
			By collaborating in the garden, volunteers build trust, empathy, and a stronger sense of belonging within their communities. 
			Community gardens become catalysts for social interactions, forging lasting relationships and a sense of collective pride. </p>
			
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 2. Environmental Stewardship: </h4>
			<img style="width: 630px" src="imgs/gardening_imgs/kid-garden-experience-idea_53876-87580.jpg" alt="Volunteers tending to plants, promoting environmental stewardship.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Volunteering in community gardens cultivates a deep appreciation for the environment and the importance of sustainable practices. 
			By engaging in hands-on gardening activities, volunteers actively contribute to environmental stewardship. 
			They help create green spaces that promote biodiversity, mitigate urban heat island effects, and improve air quality. 
			Through their efforts, volunteers become environmental advocates, spreading awareness about the importance of protecting our natural resources. </p>
			
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 3. Promoting Local Food Production: </h4>
			<img style="width: 630px" src="imgs/gardening_imgs/front-view-smiley-woman-holding-box.jpg" alt="Volunteer harvesting fresh produce from the community garden.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Community gardens provide an opportunity for people to engage in local food production and promote food security. 
			Volunteers contribute to the growth and maintenance of the gardens, yielding fresh and organic produce for themselves and the community. 
			By volunteering, individuals gain knowledge about sustainable agriculture practices, crop diversity, and seasonal planting. 
			This knowledge can be shared, empowering others to grow their own food and make healthier, sustainable choices. </p>
			 
			 <h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px"> 4. Education and Skill Sharing: </h4>
			<img style="width: 630px" src="imgs/gardening_imgs/teacher-kids-school-learning-ecology-gardening_53876-18503.jpg" alt="Volunteers exchanging gardening knowledge and skills.">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Volunteering in community gardens serves as a platform for education and skill sharing. 
			Experienced gardeners and volunteers pass on their knowledge of gardening techniques, plant care, and organic practices to newcomers. 
			This exchange of skills creates a nurturing environment for personal growth and lifelong learning. 
			Volunteers not only cultivate their own gardening expertise but also inspire others to embrace sustainable lifestyles and reconnect with the natural world. </p>
			
			<img style="margin: 0 auto; margin-top: 30px; width: 850px" src="imgs/gardening_imgs/conserving-our-future-shot-group-people-each-holding-plant-growing-soil_590464-8087.jpg" alt="The positive impact of volunteer efforts.">
			<p style="margin-bottom: 30px; margin-top: 20px;font-size: 15px; text-align: center; font-weight: bold"> Volunteering in community gardens is a powerful act that promotes community, sustainability, and personal growth. 
			By giving their time and energy, volunteers contribute to the creation of thriving green spaces, fostering stronger communities, and promoting local food production. 
			Through their dedicated efforts, volunteers become agents of positive change, inspiring others to reconnect with nature, adopt sustainable practices, and work towards a more resilient and vibrant future. </p>
			
			
			 <h1 style="font-weight: bold; font-size: 30px; text-align: center; margin-bottom: 20px; margin-top: 10px; color: purple"> Volunteer in a community Garden! </h1>
			<div class="formContainer">
				<form:form class="form-control" method="POST" modelAttribute="newVolunteer" action="/garden-volunteer">
					
						
						<h4>
							<form:label path="firstName" class="form-label">First Name: </form:label>
							<form:input type="text" path="firstName" class="form-control" />
							<form:errors path="firstName" class="text-danger"/>
						</h4>
						
						<h4>
							<form:label path="lastName" class="form-label">Last Name: </form:label>
							<form:input type="text" path="lastName" class="form-control" />
							<form:errors path="lastName" class="text-danger"/>
						</h4>
						
						<h4>
							<label class="form-label">Location: </label>
							
							<form:select path="location" class="form-select" >
							
							  <c:forEach var="oneLocation" items="${gardensList}">
							  
							  	<form:option class="form-control" value="${oneLocation.location}" > <c:out value="${oneLocation.location}"/> - <c:out value="${oneLocation.communityName}"/> </form:option>
							  
							  </c:forEach>
							  
							</form:select>
			
						</h4>
						
						<h4>
							<label class="form-label">Volunteer Type: </label>
							<form:select path="volunteerType" class="form-select" >
					
							  	<form:option class="form-control" value="Youth" selected="Youth"> Youth </form:option>
							  	<form:option class="form-control" value="Adult" > Adult </form:option>
							  	<form:option class="form-control" value="Family" > Family </form:option>
							  	<form:option class="form-control" value="Group" > Group </form:option>
					
							</form:select>
						</h4>
			
						
						<h4>
							<form:label path="email" class="form-label">Email: </form:label>
							<form:input type="text" path="email" class="form-control"/>
							<form:errors path="email" class="text-danger"/>
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
						
						
						<button type="submit" class="btn btn-success" style="margin-top: 10px; margin-left: 300px; color: #525252; hover: color: white"onmouseover="this.style.color='white';" onmouseout="this.style.color='#525252';">Submit</button>
					
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