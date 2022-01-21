<%@page import="common.DB_Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>
<html>
<title>MyRequests</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="../deluxe/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../deluxe/css/animate.css">
    
    <link rel="stylesheet" href="../deluxe/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../deluxe/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../deluxe/css/magnific-popup.css">

    <link rel="stylesheet" href="../deluxe/css/aos.css">

    <link rel="stylesheet" href="../deluxe/css/ionicons.min.css">

    <link rel="stylesheet" href="../deluxe/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../deluxe/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../deluxe/css/flaticon.css">
    <link rel="stylesheet" href="../deluxe/css/icomoon.css">
    <link rel="stylesheet" href="../deluxe/css/style.css">




<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">  <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">                <!-- Font Awesome -->
    <link rel="stylesheet" href="../level/css/bootstrap.min.css">                                      <!-- Bootstrap style -->
    <link rel="stylesheet" type="text/css" href="../level/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="../level/slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="../level/css/datepicker.css"/>
    <link rel="stylesheet" href="../level/css/tooplate-style.css">



<link rel="icon" type="image/png" href="../images/logo.png">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
 .main-block {
      display: flex;
      flex-direction: column;
      border: 2px solid gray;
      min-height: 100vh;
      background: #A4A4A4;
      }

.btn {
  border: 2px solid black;
  background-color: white;
  color: black;
  padding: 8px 16px;
  font-size: 15px;
  cursor: pointer;
  transition: 0.25s;
  border-radius: 20px;
  outline: none;
}
.edit_btn{
	 width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background: #aa1409;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
}
.success {
  border-color: #4CAF50;
  color: green;
}

.success:hover {
  background-color: #4CAF50;
  color: white;
}

.danger {
  border-color: #f44336;
  color: red;
}

.danger:hover {
  background: #f44336;
  color: white;
}

.ConfirmedLbl{
  background-color: MediumSeaGreen;
  color: white;
  padding: 8px 16px;
  font-size: 15px;
  text-align: center;
}
.notfound{
		top: 50%;
        left: 50%;
        position: absolute;
        transform: translate(-50%, -50%);
        box-sizing: border-box;
        padding: 70px 30px;
}
.Alink{

		text-decoration: none;
		border: none;
        outline: none;
        height: 40px;
        background: DodgerBlue;
        color: #fff;
        font-size: 18px;
        border-radius: 20px;
        transition: 0.25s;
        padding: 8px 16px;
}
.Alink:hover{
  		cursor: pointer;
        background: #ffc107;
        color: #000;
}
input{
		border: none;
        border-bottom: 1px solid darkgray;
        background: transparent;
        outline: none;
        height: 40px;
        color: darkgray;
        font-size: 16px;
        transition: 0.25s;
        margin-left: 20px;
}
th /* Mettre une bordure sur les td ET les th */
{
    border: 5px solid black;
    padding: 30px;
}
</style>
<body class="w3-light-grey">

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Deluxe</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="home.jsp" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="myrequests.jsp" class="nav-link">My Requests</a></li>
	          <li class="nav-item"><a href="rooms.jsp" class="nav-link">Rooms</a></li>
	          <li class="nav-item"><a href="about.jsp" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
	          <li class="nav-item"><a href="../logout.jsp"  class="nav-link">Logout</a></li>
	        </ul>
	        <script type="text/javascript">
    var pp = document.getElementById('user_name_div').innerText;
    if(pp == "null"){
      window.location.href = "../login.jsp";
    }
  </script>
	      </div>
	    </div>
	  </nav>

<!-- page content -->

<div style="width: 150%; min-height: 800px;">
		<div class="w3-container w3-margin-top" id="rooms">
			<div class="w3-row-padding w3-padding-16">
				<%
					try {
						Statement statement = null;
						ResultSet resultSet = null;
						String Countrow="";
						String CurrentUser = session.getAttribute("LogedInUserName").toString();
						
						DB_Connection obj_DB_Connection = new DB_Connection();
						Connection connection = obj_DB_Connection.get_connection();
						statement = connection.createStatement();
						String sql = "SELECT COUNT(id) FROM rooms Where RequestMadeBy = '" + CurrentUser + "'";
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
							Countrow = resultSet.getString(1);
							if(Countrow.equals("0")){
								%>

								<div class="notfound">
								<center>
								<h4>No Requests found</h4>
								</</center>
								</div>

								<%
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>


				<%
					try {
						String CurrentUser = session.getAttribute("LogedInUserName").toString();
						Statement statement = null;
						ResultSet resultSet = null;

						DB_Connection obj_DB_Connection = new DB_Connection();
						Connection connection = obj_DB_Connection.get_connection();
						statement = connection.createStatement();
						String sql = "SELECT * FROM rooms Where RequestMadeBy = '" + CurrentUser + "' ORDER BY dateNtime ASC";
						
						resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
				%>
<div class="main-block">
				<div class="w3-third w3-margin-bottom">
					<div class="w3-container w3-white">
						
		<table>
							
								
								<td><label
									style="font-family: monospace; color: red;  padding: 10px;">
										<%=resultSet.getString("dateNtime")%></label></td>
							
						</table>
<form action="../UpdateMyRequest" method="post">
<table>
   <tr>
       <th>Adult</th>
       <th>Children</th>
       <th>CheckIn Date</th>
       <th>CheckOut Date</th>
       <th>Room</th>
   </tr>

   <tr>
       <th><b id="Adults_display_val_<%=resultSet.getString("id")%>"><%=resultSet.getString("Adults")%></b>
								<input type="number" name="Adults_update_input" id="Adults_update_input_<%=resultSet.getString("id")%>"  min="1" max="6" value='<%=resultSet.getString("Adults")%>' style="display: none;">
							</th>
       <th><b><b id="Kids_display_val_<%=resultSet.getString("id")%>"><%=resultSet.getString("Kids")%></b>
								</th>
       <th><b id="CheckIn_display_val_<%=resultSet.getString("id")%>"><%=resultSet.getString("CheckIn")%></b>
								<input type="date" name="CheckIn_update_input" id="CheckIn_update_input_<%=resultSet.getString("id")%>" required="required" value='<%=resultSet.getString("CheckIn")%>' style="display: none;">
							</th>
       <th><b id="CheckOut_display_val_<%=resultSet.getString("id")%>"><%=resultSet.getString("CheckOut")%></b>
								<input type="date" name="CheckOut_update_input" id="CheckOut_update_input_<%=resultSet.getString("id")%>" required="required" value='<%=resultSet.getString("CheckOut")%>' style="display: none;">
							</th>
							<%
								if (resultSet.getString("Status").equals("1")) {
							%>
       <th> <b
								style=" padding: 2px 8px 2px 8px;"><%=resultSet.getString("RoomNo")%></b></th>
   </tr>
  <script type="text/javascript">
								 document.getElementById("hide_show_inputs_btn_<%=resultSet.getString("id")%>").style.display ="none";
								</script>
</table>
					
						
						<p class="ConfirmedLbl">Confirmed</p>
						<%
							} else {
						%>
						
						
							<input style="display: none;" type="text" name="req_id"
								value='<%=resultSet.getString("id")%>'>
							<button type="submit" class="btn success" id="save_btn_<%=resultSet.getString("id")%>" 
								style="margin-left: 20px; margin-bottom: 20px; display: none;">Save</button>
						</form>
						
						<form action="../DeletRequestByUser" method="post">
						
						
							<input style="display: none;" type="text" name="req_id"
								value='<%=resultSet.getString("id")%>'>
							<button type="submit" class="edit_btn" id="delete_btn_<%=resultSet.getString("id")%>"
								style="margin-left: 400px; margin-bottom: 20px;">Delete</button>
							</form>	
								
								<table>
							<tr>
								
										<td></td>
							</tr>
						</table>
								
								
						
						<%
							}
						%>

</div>
					</div>
				</div>

				<%
					}
					%>

					<%
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

			</div>

		</div>
	</div>

<!-- Footer -->


<script type="text/javascript">
	
	function hide_show_inputs(xx) {
		
		var hide_show_inputs_btn_txt = document.getElementById('hide_show_inputs_btn_'+xx+'').innerText;
		if(hide_show_inputs_btn_txt == 'Edit'){

			document.getElementById('hide_show_inputs_btn_'+xx+'').innerText = "Cancel";
			document.getElementById('hide_show_inputs_btn_'+xx+'').style.background = "red";
			document.getElementById('delete_btn_'+xx+'').style.display = "none";
			document.getElementById('save_btn_'+xx+'').style.display = "";

			document.getElementById('Adults_display_val_'+xx+'').style.display = "none";
			document.getElementById('Kids_display_val_'+xx+'').style.display = "none";
			document.getElementById('CheckIn_display_val_'+xx+'').style.display = "none";
			document.getElementById('CheckOut_display_val_'+xx+'').style.display = "none";

			document.getElementById('Adults_update_input_'+xx+'').style.display = "";
			document.getElementById('Kids_update_input_'+xx+'').style.display = "";
			document.getElementById('CheckIn_update_input_'+xx+'').style.display = "";
			document.getElementById('CheckOut_update_input_'+xx+'').style.display = "";

		}
		else{
			document.getElementById('hide_show_inputs_btn_'+xx+'').innerText = "Edit";
			document.getElementById('hide_show_inputs_btn_'+xx+'').style.background = "gray";
			document.getElementById('delete_btn_'+xx+'').style.display = "";
			document.getElementById('save_btn_'+xx+'').style.display = "none";

			document.getElementById('Adults_display_val_'+xx+'').style.display = "";
			document.getElementById('Kids_display_val_'+xx+'').style.display = "";
			document.getElementById('CheckIn_display_val_'+xx+'').style.display = "";
			document.getElementById('CheckOut_display_val_'+xx+'').style.display = "";

			document.getElementById('Adults_update_input_'+xx+'').style.display = "none";
			document.getElementById('Kids_update_input_'+xx+'').style.display = "none";
			document.getElementById('CheckIn_update_input_'+xx+'').style.display = "none";
			document.getElementById('CheckOut_update_input_'+xx+'').style.display = "none";
		}

		
	}

</script>
<%@ include file="/../include/footer.jsp" %>
<script src="../deluxe/js/jquery.min.js"></script>
  <script src="../deluxe/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../deluxe/js/popper.min.js"></script>
  <script src="../deluxe/js/bootstrap.min.js"></script>
  <script src="../deluxe/js/jquery.easing.1.3.js"></script>
  <script src="../deluxe/js/jquery.waypoints.min.js"></script>
  <script src="../deluxe/js/jquery.stellar.min.js"></script>
  <script src="../deluxe/js/owl.carousel.min.js"></script>
  <script src="../deluxe/js/jquery.magnific-popup.min.js"></script>
  <script src="../deluxe/js/aos.js"></script>
  <script src="../deluxe/js/jquery.animateNumber.min.js"></script>
  <script src="../deluxe/js/bootstrap-datepicker.js"></script>
  <script src="../deluxe/js/jquery.timepicker.min.js"></script>
  <script src="../deluxe/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../deluxe/js/google-map.js"></script>
  <script src="../deluxe/js/main.js"></script>


<script src="../level/js/jquery-1.11.3.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
        <script src="../level/js/popper.min.js"></script>                    <!-- https://popper.js.org/ -->       
        <script src="../level/js/bootstrap.min.js"></script>                 <!-- https://getbootstrap.com/ -->
        <script src="../level/js/datepicker.min.js"></script>                <!-- https://github.com/qodesmith/datepicker -->
        <script src="../level/js/jquery.singlePageNav.min.js"></script>      <!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
        <script src="../level/slick/slick.min.js"></script>                  <!-- http://kenwheeler.github.io/slick/ -->
        

</body>
</html>
