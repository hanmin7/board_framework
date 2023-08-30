<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update.jsp</title>

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
    <form action="/board/update" method="post" name="updateForm">
        <div class="container">
            <div id="board-search">
                <div class="search-window">
                    <div class="row mb-3">
                        <label for="inputText" class="col-sm-2 col-form-label">작성자</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputText" name="boardWriter" value="${board.boardWriter}" readonly>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputText" class="col-sm-2 col-form-label">비밀번호</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="boardPass" id="boardPass">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputText" class="col-sm-2 col-form-label">제목</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputTitle" name="boardTitle" value="${board.boardTitle}">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="inputText" class="col-sm-2 col-form-label">내용</label>
                    </div>
                </div>
                <div class="form-group">
                    <textarea class="form-control" name="boardContents" cols="30" rows="10">${board.boardContents}</textarea>
                </div>
                <div class="container">
                    <input type="button" value="수정" onclick="updateReqFn()">
                    <input type="hidden" name="id" value="${board.id}" readonly>
                </div>

            </div>
        </div>
    </form>
</section>


</body>
<script>
    const updateReqFn = () => {
        const passInput = document.getElementById("boardPass").value;
        const passDB = '${board.boardPass}';
        if (passInput == passDB) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!!");
        }
    }
</script>
</html>
