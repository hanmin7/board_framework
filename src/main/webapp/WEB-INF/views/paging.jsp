<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>paging</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link href="/resources/css/test.css" rel="stylesheet"/>
    <style>
        thead {
            background-color: #f9f7f9;
        }
    </style>
</head>
<body>

<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>게시판 목록</h3>
        </div>
    </div>

    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">id</th>
                    <th scope="col" class="th-title">title</th>
                    <th scope="col" class="th-num">writer</th>
                    <th scope="col" class="th-date">date</th>
                    <th scope="col" class="th-num">hits</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList}" var="board">
                    <tr>
                        <td>${board.id}</td>
                        <th>
                            <a href="/board?id=${board.id}&page=${paging.page}">${board.boardTitle}</a>

                        </th>
                        <td>${board.boardWriter}</td>
                        <td>${board.boardCreatedTime}</td>
                        <td>${board.boardHits}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div id="board-search">
        <div class="container">
            <div class="search-window" style="text-align: center">

                        <c:choose>
                            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                            <c:when test="${paging.page<=1}">
                                <span>[이전]</span>
                            </c:when>
                            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
                            <c:otherwise>
                                <a href="/board/paging?page=${paging.page-1}">[이전]</a>
                            </c:otherwise>
                        </c:choose>

                        <%--  for(int i=startPage; i<=endPage; i++)      --%>
                        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                            <c:choose>
                                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                                <c:when test="${i eq paging.page}">
                                    <span>${i}</span>
                                </c:when>

                                <c:otherwise>
                                    <a href="/board/paging?page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${paging.page>=paging.maxPage}">
                                <span>[다음]</span>
                            </c:when>
                            <c:otherwise>
                                <a href="/board/paging?page=${paging.page+1}">[다음]</a>
                            </c:otherwise>
                        </c:choose>

            </div>
        </div>
    </div>


</section>


</body>
</html>
