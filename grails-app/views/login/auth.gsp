<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<asset:stylesheet src="application.css"/>
<asset:javascript src="application.js"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<title>Project Management - Login In</title>
</head>
<body class="bg-black">
<g:if test='${flash.message}'>
    <div class='login_message'>
        ${flash.message}
    </div>
</g:if>
<div class="form-box" id="login-box">
    <div class="header">Sign In</div>
    <form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
        <div class="body bg-gray">
            <div class="form-group">
                <input type="text" name="j_username" class="form-control" placeholder="User ID"/>
            </div>
            <div class="form-group">
                <input type="password" name="j_password" class="form-control" placeholder="Password"/>
            </div>
            <div class="form-group">
                <input type="checkbox" name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if> />  Remember me
            </div>
        </div>
        <div class="footer">
            <button type="submit" class="btn bg-olive btn-block"  value='${message(code: "springSecurity.login.button")}'>Sign me in</button>


        </div>
    </form>


</div>
	
</body>
</html>
