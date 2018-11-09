<%--
  Created by IntelliJ IDEA.
  User: domin
  Date: 2018-10-11
  Time: 오후 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./header.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>자재관리프로그램</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link href="../../starter-template.css" rel="stylesheet">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${contextPath}/home">Home</a></li>
                <li class="active"><a href="${contextPath}/customerInsert"> 거래처입력</a></li>
                <li><a href="${contextPath}/customerView"> 거래처보기</a></li>
                <li><a href="${contextPath}/productInsert"> 자재명입력</a></li>
                <li><a href="${contextPath}/productView"> 자재모두보기</a></li>
                <li><a href="${contextPath}/productFind"> 자재찾기</a></li>
                <li><a href="${contextPath}/productRelease"> 자재출고</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">

    <div class="starter-template">
        <h1>거래처 입력</h1>
        <form class="form-horizontal" role="form" method="post">
            <div class="form-group">
                <label for="customerName" class="col-sm-2 control-label">거래처 명</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="customerName" id="customerName"
                           placeholder="Customer Name">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">거래처 코드</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="code" id="code" placeholder="Customer Code">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button formaction="${contextPath}/customerInsert.do" type="submit" class="btn btn-default">등록
                    </button>
                </div>
            </div>
        </form>
    </div>

</div><!-- /.container -->

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
