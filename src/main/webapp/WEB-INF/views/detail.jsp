<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detail.jsp</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

    <link href="/resources/css/test.css" rel="stylesheet"/>

</head>
<body>

<section class="notice">
<div id="board-list">
    <div class="container">
        <table class="board-table">
            <thead>
            <tr>
                <th scope="col" class="th-num">id</th>
                <td>${board.id}</td>
            </tr>
            <tr>
                <th scope="col" class="th-date">writer</th>
                <td>${board.boardWriter}</td>
            </tr>
            <tr>
                <th scope="col" class="th-date">date</th>
                <td>${board.boardCreatedTime}</td>
            </tr>
            <tr>
                <th scope="col" class="th-num">hits</th>
                <td>${board.boardHits}</td>
            </tr>
            <tr>
                <th>contents</th>
                <td>${board.boardContents}</td>
            </tr>
            </thead>

        </table>




        <button onclick="listFn()">목록</button>
        <button onclick="updateFn()">수정</button>
        <button onclick="deleteFn()">삭제</button>

        <div>
            <input type="text" id="commentWriter" placeholder="작성자">
            <input type="text" id="commentContents" placeholder="내용">
            <button id="comment-write-btn" onclick="commentWrite()">댓글작성</button>
        </div>

        <div id="comment-list">
            <table>
                <tr>
                    <th>댓글번호</th>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.id}</td>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td>${comment.commentCreatedTime}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>
</section>

</body>
<script>
    const listFn = () => {
        const page = '${page}';
        location.href = "/board/paging?page=" + page;
    }
    const updateFn = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const deleteFn = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }

    const commentWrite = () => {
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const board = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: board
            },
            dataType: "json",
            success: function(commentList) {
                console.log("작성성공");
                console.log(commentList);
                let output = "<table>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].id+"</td>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentContents+"</td>";
                    output += "<td>"+commentList[i].commentCreatedTime+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error: function() {
                console.log("실패");
            }
        });
    }
</script>
</html>
