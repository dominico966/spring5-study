<%--
  Created by IntelliJ IDEA.
  User: domin
  Date: 2018-10-12
  Time: 오후 3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./header.jsp" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <li><a href="${contextPath}/command.do?command=<%=Command.Table.GoTop%>">Home</a></li>
                <li><a href="${contextPath}/command.do?command=<%=Command.Table.GoCustomerInsert%>"> 거래처입력</a></li>
                <li><a href="${contextPath}/command.do?command=<%=Command.Table.GoCustomerView%>"> 거래처보기</a></li>
                <li><a href="${contextPath}/command.do?command=<%=Command.Table.GoProductInsert%>"> 자재명입력</a></li>
                <li><a href="${contextPath}/command.do?command=<%=Command.Table.GoProductView%>"> 자재모두보기</a></li>
                <li><a href="${contextPath}/command.do?command=<%=Command.Table.GoProductFind%>"> 자재찾기</a></li>
                <li class="active"><a href="${contextPath}/command.do?command=<%=Command.Table.GoProductRelease%>">
                    자재출고</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container-fluid">

    <div class="starter-template">
        <h1>자재출고</h1>

        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="productCode" class="col-sm-2 control-label">자재코드</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="productCode" id="productCode"
                           placeholder="Customer Name">
                </div>
            </div>
            <div class="form-group">
                <label for="quantity" class="col-sm-2 control-label">수량</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" name="quantity" id="quantity" placeholder="Customer Code">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button formaction="${contextPath}/command.do" name="command"
                            value="<%=Command.Table.DoProductRelease%>" type="submit" class="btn btn-default">출고
                    </button>
                </div>
            </div>
        </form>

        <c:choose>
            <c:when test="${requestScope.list != null}">
                <table class="table">
                    <thead>
                    <tr>
                        <th>거래처명</th>
                        <th>자재명</th>
                        <th>규격</th>
                        <th>자재코드번호</th>
                        <th>이미지</th>
                        <th>수량</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dto" items="${requestScope.list}">
                        <tr>
                            <td>${dto.customerName}</td>
                            <td>${dto.productName}</td>
                            <td>${dto.standard}</td>
                            <td>${dto.productCode}</td>
                            <c:set var="defaultPath" value="${contextPath}/img/no_item.png"/>
                            <td><img src="<${(empty dto.imagePath)? defaultPath : dto.imagePath}" width="70px"></td>
                            <c:remove var="${defaultPath}"/>
                            <td>${dto.quantity}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="lead">등록된 거래처가 존재하지 않습니다.</p>
            </c:otherwise>
        </c:choose>
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

