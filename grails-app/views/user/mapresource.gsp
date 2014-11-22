<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
    <meta name="layout" content="main"/>
    <title>Map Resource - Project Resource Management</title>
    <style>
    html, body {
        min-height: 100%;
        padding: 0;
        margin: 0;
        font-family: 'Source Sans Pro', "Helvetica Neue", Helvetica, Arial,
        sans-serif;
    }

    iframe {
        display: block;
        overflow: auto;
        border: 0;
        margin: 0;
        padding: 0;
        margin: 0 auto;
    }

    .frame {
        height: 49px;
        margin: 0;
        padding: 0;
        border-bottom: 1px solid #ddd;
    }

    .frame a {
        color: #666;
    }

    .frame a:hover {
        color: #222;
    }

    .frame .buttons a {
        height: 49px;
        line-height: 49px;
        display: inline-block;
        text-align: center;
        width: 50px;
        border-left: 1px solid #ddd;
    }

    .frame .brand {
        color: #444;
        font-size: 20px;
        line-height: 49px;
        display: inline-block;
        padding-left: 10px;
    }

    .frame .brand small {
        font-size: 14px;
    }

    a, a:hover {
        text-decoration: none;
    }

    .container-fluid {
        padding: 0;
        margin: 0;
    }

    .text-muted {
        color: #999;
    }

    .ad {
        text-align: center;
        position: fixed;
        bottom: 0;
        left: 0;
        background: #222;
        background: rgba(0, 0, 0, 0.8);
        width: 100%;
        color: #fff;
        display: none;
    }

    #close-ad {
        float: left;
        margin-left: 10px;
        margin-top: 10px;
        cursor: pointer;
    }
    </style>

</head>

<body class="skin-blue">

<header class="header">
    <a href="index.html" class="logo">Project Management</a>
    <nav class="navbar navbar-static-top" role="navigation"></nav>
</header>

<div class="wrapper row-offcanvas row-offcanvas-left">
    <g:render template="menu"></g:render>
    <aside class="right-side">
        <section class="content-header">
            <h1>Map Resource</h1>
            <small>Search and Map Resource</small>
        </section>
    </aside>
</div>

</body>
</html>