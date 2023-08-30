<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>list</title>

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

    <!-- board seach area
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">공지사항 내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    -->
    <!-- board list area -->
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




</section>


</body>
</html>
