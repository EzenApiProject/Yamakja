<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>호신용품은 야막자</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="../css/style1.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
<main class="mt-5 pt-5">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Board</h1>
        <div class="card mb-4">
            <div class="card-body">
                <form>
                    <div class="mb-3 mt-3">
                        <img class="m-auto" src="${news.FPath}" width="100%">
                    </div>
                    <div class="mb-3">
                        <label for="title" class="form-label">title</label> <input
                            type="text" class="form-control" id="title" name="title"
                            value="${news.title}" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">content</label>
                        <textarea class="form-control" id="content" name="content"
                                  disabled>${news.content}</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="regDate" class="form-label">regDate</label> <input
                            type="text" class="form-control" id="regDate" name="regDate"
                            value="${news.createdAt}" disabled>
                    </div>
                </form>
                <div class="container">
                    <c:forEach var="comment" items="comment" varStatus="status">
                        <c:if test="${status.last} != 0">
                            <p>${comment.memberId}</p>
                            <p>${comment.title}</p>
                            <p>${comment.comment}</p>
                            <p>${comment.createdAt}</p>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
