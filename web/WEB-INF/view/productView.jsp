<%--
  Created by IntelliJ IDEA.
  User: domin
  Date: 2018-10-11
  Time: 오후 3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./header.jsp" %>
<c:if test="${sessionScope.admin == null}">
    <script>
        alert("관리자만 가능합니다.");
        location.href = '${contextPath}/home';
    </script>
</c:if>

<c:if test="${sessionScope.admin != null}">
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
                    <li><a href="${contextPath}/customerInsert"> 거래처입력</a></li>
                    <li><a href="${contextPath}/customerView"> 거래처보기</a></li>
                    <li><a href="${contextPath}/productInsert"> 자재명입력</a></li>
                    <li class="active"><a href="${contextPath}/productView"> 자재모두보기</a></li>
                    <li><a href="${contextPath}/productFind"> 자재찾기</a></li>
                    <li><a href="${contextPath}/productRelease"> 자재출고</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

    <div class="container">

        <div class="starter-template">
            <h1>거래처 보기</h1>
            <c:choose>
                <c:when test="${empty requestScope.list}">
                    <p class="lead">등록된 거래처가 존재하지 않습니다.</p>
                </c:when>
                <c:otherwise>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>거래처명</th>
                            <th>자재명</th>
                            <th>규격</th>
                            <th>자재코드번호</th>
                            <th>이미지</th>
                            <th>수량</th>
                            <th>수정/삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="lineNo" value="1"/>
                        <c:forEach var="dto" items="${requestScope.list}">
                            <tr>
                                <td>
                                        ${lineNo}
                                </td>
                                <td>${dto.customer.customerName}
                                </td>
                                <td>${dto.product.productName}
                                </td>
                                <td>${dto.product.standard}
                                </td>
                                <td>${dto.product.productCode}
                                </td>
                                <td><img
                                        src="${(empty dto.product.imagePath) ? defaultPath : dto.product.imagePath }"
                                        width="70px">
                                </td>
                                <td>${dto.product.quantity}
                                </td>
                                <td>
                                    <a href="${contextPath}/productUpdate/${dto.product.productCode}">수정</a>
                                    <span> | </span>
                                    <a href="${contextPath}/productDelete.do/${dto.product.productCode}">삭제</a>
                                </td>
                            </tr>
                            <c:set var="lineNo" value="${lineNo + 1}"/>
                        </c:forEach>
                        <c:remove var="lineNo"/>
                        </tbody>
                    </table>
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

</c:if>