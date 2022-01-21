<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Account</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>

<body>

     <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/collaboration.png">
        <h1>Sign Up</h1>
        <form action="SignupServerlet" method="post">
            <p>Username</p>
            <input type="text" name="newuser" placeholder="Enter Your Username" required="required">
            <p>Password</p>
            <input type="password" name="newpass" placeholder="Enter Your Password" required="required">
            <p>Confirm Password</p>
            <input type="password" name="newconpass" placeholder="Confirm your Password" required="required">
            <p>Email</p>
            <input type="email" name="newemail" placeholder="Enter Your Email" required="required">
            <input type="submit" name="login" value="Login"><br>
            <a href="login.jsp">Already have an account?</a>
        </form>
    </div>
 </div>
</body>


</html>