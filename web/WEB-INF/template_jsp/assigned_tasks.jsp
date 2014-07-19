<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="taskmenu ib">
    <div class="title-bar block">
        You have these tasks unfinished
    </div>
    <div class="tasks">
        <c:forEach items="${sessionScope.tasklist}" var="task">
        <div class="task-list-detail block row">
            <a data-taskid="${task.taskID}">
                <div class="col-xs-2 col-sm-2 col-md-2 task-id">${task.taskID}</div>
                <div class="col-xs-10 col-sm-10 col-md-10 task-title">${task.taskName}</div>
            </a>
        </div>  
        </c:forEach>
    </div>
</div>
