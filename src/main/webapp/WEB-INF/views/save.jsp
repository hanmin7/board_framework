<%--
  Created by IntelliJ IDEA.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <link href="/resources/css/test.css" rel="stylesheet"/>

</head>
<body>

<section class="notice">
    <form action="/board/save" method="post">
        <div class="container">
            <div id="board-search">
                <div class="search-window">
                    <div class="row mb-3">
                        <label for="inputText" class="col-sm-2 col-form-label">작성자</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputText" name="boardWriter" placeholder="작성자">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputPass" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputPass" name="boardPass" placeholder="비밀번호">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputTitle" class="col-sm-2 col-form-label">제목</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputTitle" name="boardTitle" placeholder="제목">
                        </div>
                    </div>
                </div>
                    <div class="form-group">
                        <textarea class="form-control" name="boardContents" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
                    </div>
            <div class="container">
                <input type="submit" value="작성">
            </div>

        </div>
        </div>
    </form>
</section>
</body>
</html>
