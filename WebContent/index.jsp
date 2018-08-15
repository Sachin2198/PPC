<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="DAO.LoginDAO"%>
<%@page import="model.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="apple-touch-icon" href="apple-touch-icon.png">


        <link rel="stylesheet" href="assets/css/fonticons.css">
        <link rel="stylesheet" href="assets/fonts/stylesheet.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/jquery.fancybox.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src ="NoBack.js"></script>

</head>

 <body data-spy="scroll" data-target=".navbar-collapse" onload="noBack();" onpageshow="if (event.persisted) noback();" onunload="">
    
<%    /* This is first Admin code. */
    Login lg = new Login();
    lg.setUserName("PPC");
    String St=null;
	String password= "12345";
	try {
		St=LoginDAO.sha1(password);
	} catch (NoSuchAlgorithmException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	lg.setPassword(St);
    /* lg.setPassword("12345"); */
    lg.setRoleName("admin");
   	
    LoginDAO ldao = new LoginDAO();
    Login exist=ldao.userAuthentication("PPC",St);
    if(exist==null)
    	ldao.addUserLogin(lg);
    /*............END............  */
%>
   
    
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <div class="culmn">
            <header id="main_menu" class="header navbar-fixed-top">            
                <div class="main_menu_bg">
                    <div class="container">
                        <div class="row">
                            <div class="nave_menu">
                                <nav class="navbar navbar-default">
                                    <div class="container-fluid">
                                        <!-- Brand and toggle get grouped for better mobile display -->
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                           <!--  <a class="navbar-brand" href="#home">
                                                <img src="assets/images/logo.png"/>
                                            </a> -->
                                        </div>

                                        <!-- Collect the nav links, forms, and other content for toggling -->



                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                                            <ul class="nav navbar-nav navbar-right">
                                                <li><a href="">HOME</a></li>
                                                <li><a href="login.jsp">LOGIN</a></li>
                                                <!-- <li><a href="Product.jsp">PRODUCTS</a></li> -->
                                                <li><a href="Adminlogin.jsp">Admin</a></li>
                                                <li><a href="">PEOPLE SAY</a></li>
                                                <li><a href="#team">TEAM MEMBERS</a></li>
                                                <li><a href="#footer">CONTACT</a></li>
                                            </ul>


                                        </div>

                                    </div>
                                </nav>
                            </div>	
                        </div>

                    </div>

                </div>
            </header> <!--End of header -->





            <section id="home" class="home">
                <div class="overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 ">
                                <div class="main_home_slider text-center">
                                    <div class="single_home_slider">
                                        <div class="main_home wow fadeInUp" data-wow-duration="700ms">
                                            <h2>We Are Awesome Productive Agency</h2>
                                            <div class="separator"></div>
                                            <p>The productive skills are speaking and writing, because<br>
                                             learners doing these need to produce language. They are also known<br> 
                                             as active skills. They can be compared with the receptive<br>
                                              skills of listening and reading.</p>
                                            <div class="home_btn">
                                                <a href="" class="btn btn-primary">LEARN MORE</a>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="single_home_slider">
                                        <div class="main_home wow fadeInUp" data-wow-duration="700ms">
                                            <h2>We Are Awesome Planning Agency</h2>
                                            <div class="separator"></div>
                                            <p>Planning is the thinking skill that helps an individual<br>
                                             develop strategies to accomplish goals. <br>
                                             It helps a child to think about how to complete<br> 
                                             a task before attempting to begin it.</p>
                                            <div class="home_btn">
                                                <a href="" class="btn btn-primary">LEARN MORE</a>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="single_home_slider">
                                        <div class="main_home wow fadeInUp" data-wow-duration="700ms">
                                            <h2>We Are Awesome Controlling Agency</h2>
                                            <div class="separator"></div>
                                            
                                             <p>Controlling consists of verifying whether everything occurs in <br>
                                             confirmities with the plans adopted, instructions issued and principles<br> 
                                             established.Controlling measures the deviation of actual performance <br>
                                             from the standard performance, discovers the causes of such deviations <br>
                                             and helps in taking corrective actions</p>
                                            <div class="home_btn">
                                                <a href="" class="btn btn-primary">LEARN MORE</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>





            <section id="about" class="about">
                <div class="container">
                    <div class="row">

                        <div class="main_about_area sections">
                            <div class="col-sm-10 col-sm-offset-1">

                                <div class="main_about_content">
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <div class="single_about_left_img text-center wow fadeInLeft" data-wow-duration=".6s">
                                                <img src="assets/images/ableft.png" alt="" />
                                            </div>
                                        </div>
                                        <div class="col-sm-7 wow fadeInRight" data-wow-duration="700ms">
                                            <div class="single_about_right_content">
                                                <h3>GOOD, BETTER, BEST. NEVER LET IT<br>
                                                REST. 'TIL YOUR GOOD IS BETTER AND YOUR BETTER IS BEST. </h3>
                                               <p>-St Jerome</p>

                                               <!--  <div class="home_btn">
                                                    <a href="" class="btn btn-primary">LEARN MORE</a>
                                                </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>


   
            <section id="team" class="team">
                <div class="video_overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="main_team sections text-center">
                                    <div class="row">
                                        <div class="head_title text-center">
                                            <h3>TEAM</h3>
                                            <p>They are our team members.</p>
                                            <div class="separator2"></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-12">
                                            <div class="single_team_content">
                                                <div class="single_team_img">
                                                    <img src="assets/images/Sachin.jpg" alt="" />
                                                </div>
                                                <div class="single_team_text">
                                                    <h4>Sachin Gupta</h4>
                                                    <p>Engineer</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-3 col-xs-12">
                                            <div class="single_team_content">
                                                <div class="single_team_img">
                                                    <img src="assets/images/Mukesh.jpg" alt="" />
                                                </div>
                                                <div class="single_team_text">
                                                    <h4>Mukhesh Yadav</h4>
                                                    <p>Engineer</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-3 col-xs-12">
                                            <div class="single_team_content">
                                                <div class="single_team_img">
                                                    <img src="assets/images/facebook_1532496450844.jpg" alt="" />
                                                </div>
                                                <div class="single_team_text">
                                                    <h4>Swati Gupta</h4>
                                                    <p>Engineer</p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-3 col-xs-12">
                                            <div class="single_team_content">
                                                <div class="single_team_img">
                                                    <img src="assets/images/Robin.jpg" alt="" />
                                                </div>
                                                <div class="single_team_text">
                                                    <h4>Robin Kumar</h4>
                                                    <p>Engineer</p>
                                                </div>
                                            </div>
                                        </div> <!-- End of col-sm-4 -->
                                    </div>
                                    <div class="team_hiring_area">
                                        <p>Become part of our dream team, let’s join us ! </p>
                                        <a href="" class="btn btn-primary">we are Hiring</a>
                                    </div>
                                </div><!-- End of main team contant -->
                            </div>
                        </div><!-- End of row -->
                    </div>
                </div>
            </section>






     

            <section id="contact" class="contact sections">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="row">
                                <div class="contact_contant">

                                    <div class="col-sm-6">
                                        <h4>GIVE US A GOOD NEWS</h4>
                                        <div class="single_contant_left">
                                            <form action="#" id="formid">
                                                <!--<div class="col-lg-8 col-md-8 col-sm-10 col-lg-offset-2 col-md-offset-2 col-sm-offset-1">-->

                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="name" placeholder="first name" required="">
                                                </div>

                                                <div class="form-group">
                                                    <input type="email" class="form-control" name="email" placeholder="Email" required="">
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
                                                </div>

                                                <div class="form-group">
                                                    <textarea class="form-control" name="message" rows="8" placeholder="Message"></textarea>
                                                </div>

                                                <div class="">
                                                    <input type="submit" value="Submit" class="btn btn-primary">
                                                </div>
                                                <!--</div>--> 
                                            </form>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">

                                  
                            </div>
                        </div>
                    </div>
                </div>
            </section>



            <section id="footer" class="footer_widget">
           <div class="video_overlay">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="row">
                               <!--  ------------------------------------------------------ -->
                                <div class="col-sm-4  col-xs-12">
                                            <div class="single_widget wow fadeIn" data-wow-duration="800ms">
                                                <h4>CONTACT US</h4>
                                                <ul>
                                                    <li><a href="">
                                                            <i class="fa fa-map-marker"></i> 
                                                            <span>JSW Steel LTD.<br>
                                                           		  A-2, Loniroad Industrial Area, Ghaziabad Industrial Area,<br> 
                                                            	  Ghaziabad, Uttar Pradesh 201010
                                                            	  <b>Opening Hours:</b> 9am - 6pm
                                                            </span>
                                                        </a></li>
                                                    <li><a href=""><i class="fa fa-phone"></i> 0123 456 789 0112</a></li>
                                                </ul> 
                                            </div>
                                        </div>
                               <!--  ------------------------------------------------------ -->
                                <div class="main_footer text-center">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <ul class="right_menu list-inline">
                                                <li><a href="">HELP</a></li>
                                                <li><a href="">TERMS & CONDITION</a></li>
                                                <li><a href="">PRIVACY</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="copyright_text">
                                                <p class=" wow fadeInRight" data-wow-duration="1s" style="font-size: 20px">Copyright &copy; All Rights Reserved</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>







        </div>

        <!-- START SCROLL TO TOP  -->

        <div class="scrollup">
            <a href="#"><i class="fa fa-chevron-up"></i></a>
        </div>

        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/jquery.magnific-popup.js"></script>
        <script src="assets/js/jquery.mixitup.min.js"></script>
        <script src="assets/js/jquery.easing.1.3.js"></script>
        <script src="assets/js/jquery.masonry.min.js"></script>
        <script src="assets/js/jquery.fancybox.pack.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>


</html>