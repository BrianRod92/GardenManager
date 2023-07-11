<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Home | We Run Gardens</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/imgs/logo/werungardens.png">
<script src="https://kit.fontawesome.com/9de172fcd8.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<script src="/js/chatMessageCount.js"></script>
<script src="/js/index.js"></script>

</head>
<body style="background-color: #f7f8f1">

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
	
	<h1 style="font-weight: bold; font-size: 40px; width:900px; text-align: center; margin: 0 auto; margin-top: 30px; margin-bottom: 10px; color: #1b1f0f">Welcome to '<span class="title">We Run Gardens</span>',
	 <br> where communities <span class="title">Grow</span> together!</h1>
	 
	
		<div class="slideshow">

	        	<img src="/imgs/gardening_imgs//Best-Plants-for-a-Community-Garden-in-Moderate-Climates-1024x682.jpg" alt="Kids standing in a Community Garden">
	    
	    	
	        	<img src="/imgs/gardening_imgs/c89e77-iStock-1364679535.jpg" alt="Teacher teaching kids in Community Garden.">
	    
	    	
	        	<img src="/imgs/gardening_imgs/r0_0_7359_4906_w1200_h678_fmax.jpg" alt="Beautiful Community Garden with people picking vegetables.">
	    
	    	
	    	
	        	<img src="/imgs/gardening_imgs/The Benefits of Starting a Community Garden_1260x630.png" alt="Volunteers standing around in circle around vegetables.">
	    
	    	
	    	
	        	<img src="/imgs/gardening_imgs/ghows-WT-776f5092-331d-4180-e053-0100007ffea6-5716684c.jpeg" alt="Volunteers working planting trees.">
	    
	    	
	    	
	        	<img src="/imgs/gardening_imgs/Untitled-design-2.png" alt="Beautiful path with flowers.">
	    
	    	
		</div>
		<hr style="width: 1000px; margin: 0 auto; margin-bottom: 20px; margin-top: 20px">
			<p style="margin-bottom: 20px; margin-top: 10px; font-size: 20px; text-align: center; width: 800px; margin: 0 auto "> Welcome to our community garden application, where we celebrate the beauty of nature, the joy of gardening, 
			and the power of coming together as a community. We believe in the importance of living sustainably, reconnecting with the earth, and enjoying the benefits of locally sourced food. 
			Whether you're passionate about gardening or eager to lend a helping hand, we invite you to be a part of this green revolution. Read on to learn how you can get involved! </p>

		
			
			<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Become a Volunteer: </h4>
			<img style="width: 500px;" src="/imgs/gardening_imgs/beautiful-couple-works-garden_1157-24608.jpg" alt="Couple working on garden.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Are you passionate about gardening but lack the space or resources to create your own garden? 
			Join us as a volunteer and experience the joy of nurturing nature alongside like-minded individuals. As a volunteer, you'll have the opportunity to learn from experienced gardeners, gain valuable skills, and make 
			lasting friendships. <br> <span><a style="text-align: center; " href="/garden-volunteer"> Sign up as a Volunteer now! </a></span> </p>
			
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 60px; ">Create and Manage Your Own Garden: </h4>
			<img style="width: 500px; height:333.06px" src="/imgs/gardening_imgs/group-people-planting-vegetable-greenhouse_53876-2333.jpg" alt="Group of people planting vegatbles.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Are you ready to take your love for gardening to the next level?
			 Our application allows you to become a garden manager and create your own thriving oasis within your community. As a manager, you'll have the freedom to plan events, 
			 organize workshops, and guide fellow gardeners on their green journey. Your garden will become a hub of inspiration, knowledge, and togetherness. 
			 <br> <span><a style="text-align: center; " href="/manage-garden"> Ready to be a Garden Manager? Sign up now! </a></span> </p>
			
			</div>
			
			</div>
			
			<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Embrace the Power of Community Gardening: </h4>
			<img style="width: 500px" src="/imgs/gardening_imgs/people-meeting-barter-event-exchange-goods.jpg" alt="People sharing gardening tips and produce.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Community gardens are more than just places to grow fruits, vegetables, and flowers; 
			they are vibrant hubs that foster connections, knowledge sharing, and a sense of belonging. By joining or creating a community garden, you'll be contributing 
			to a greener environment, supporting local food systems, and promoting a healthier lifestyle for yourself and future generations. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> The Impact of Eating Locally Sourced Food: </h4>
			<img style="width: 500px" src="/imgs/gardening_imgs/child-garden-with-vegetables-his-hands_73944-8730.jpg" alt="A colorful spread of fresh vegetables and fruits, highlighting the diversity and abundance of locally sourced produce.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Did you know that eating locally sourced food has numerous benefits for both your health and the environment? 
			By supporting community gardens and local farmers, you reduce the carbon footprint associated with long-distance transportation. Locally grown produce is fresher, more nutritious, and supports a more sustainable food system. 
			Together, we can make a positive impact on our environment while savoring the delicious flavors of homegrown food. </p>
			</div>
			
			</div>
			
			<div style="display: flex; align-items: center; justify-content: space-evenly; margin-left: 100px">
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px; margin-top: 40px; "> Join Our Growing Community Today: </h4>
			<img style="width: 500px" src="/imgs/gardening_imgs/community-service-volunteering-people-plant-trees-park-garden-nature-sustainable-environment-climate-change-soil-gardening-sustainabi.jpg" alt="Volunteers planting garden.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Take a step towards a greener future and become a part of our community garden movement. 
			Whether you're a volunteer eager to get your hands dirty or a manager ready to cultivate change, we welcome you with open arms. Let's nurture the earth, cultivate friendships, 
			and sow the seeds of a sustainable tomorrow. </p>
			</div>
			
			<div>
			<h4 style="font-weight: bold; margin-bottom: 10px; font-size: 20px;  "> Get involved, create, or volunteer in a community garden now! </h4>
			<img style=" width: 500px" src="/imgs/manager_imgs/Community Garden 3.png" alt="A vibrant community garden, buzzing with activity and brimming with colorful flowers and fresh produce.">
			<p style="text-align: center; width: 500px; margin-bottom: 20px; margin-top: 10px; font-size: 15px "> Together, we can make a difference—one garden at a time. Let's grow, learn, 
			and celebrate the abundance of nature in our own backyards. Join our community garden application today! </p>
			</div>
			
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
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
 	 $(document).ready(function() {
    	var images = $('.slideshow img');
   		 var currentIndex = 0;
    
    	setInterval(function() {
      images.removeClass('active');
      images.eq(currentIndex).addClass('active');
      currentIndex = (currentIndex + 1) % images.length;
   		 }, 3000); // Adjust the interval time (in milliseconds) between transitions
 		 });
	</script>
	
	
	
	

</body>
</html>