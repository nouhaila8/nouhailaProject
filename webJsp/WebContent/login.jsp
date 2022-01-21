<%
session.invalidate();
%>
<html>


<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join Us</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="container">
            <div class="box">
        <img class="avatar" src="img/user-avatar.png">
        <h1>Login</h1>
        <form action="LoginServerlet" method="post">
            <p>Username</p>
            <input type="text" name="user" placeholder="Enter Your Username">
            <p>Password</p>
            <input type="password" name="pass" placeholder="Enter Your Password">
            <input type="submit" name="login" value="Login"><br>
            <a href="signup.jsp">Don't have an account?</a>
        </form>
    </div>
    </div>

</body>

</html>
