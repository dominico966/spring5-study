<%--
  Created by IntelliJ IDEA.
  User: domin
  Date: 2018-10-11
  Time: 오후 4:27
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
            <h1>자재 수정 입력</h1>
            <form class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="customer" class="col-sm-2 control-label">거래처 명</label>
                    <div class="col-sm-10">
                        <select name="customerCode" id="customer" class="form-control" style="height:30px">
                            <option value="${dto.customer.code}" selected>
                                    ${dto.customer.customerName}
                            </option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="productName" class="col-sm-2 control-label">자재명</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="productName" id="productName"
                               placeholder="Product Name" value="${dto.product.productName}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="standard" class="col-sm-2 control-label">자재규격</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="standard" id="standard"
                               placeholder="Product Standard" value="${dto.product.standard}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="productCode" class="col-sm-2 control-label">자재코드</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="productCode" id="productCode"
                               placeholder="Product Code" value="${dto.product.productCode}" readonly>
                    </div>
                </div>

                <div class="form-group">
                    <label for="imagePath" class="col-sm-2 control-label">이미지</label>
                    <div class="col-sm-10">
                        <img src="${contextPath}/${(empty dto.product.imagePath)? defaultPath : dto.product.imagePath}"
                             width="100px"/>
                        <input type="file" class="form-control" name="imagePath" id="imagePath">
                    </div>
                </div>

                <div class="form-group">
                    <label for="quantity" class="col-sm-2 control-label">수량</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="quantity" id="quantity"
                               placeholder="Quantity" value="${dto.product.quantity}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button formaction="${contextPath}/productUpdate.do" type="submit" class="btn btn-default">
                            수정
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
</c:if>