<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>iCal Generator</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/error.css"/>" rel="stylesheet">
</head>
<body>
    <div class="page-header text-center">
        <h1>iCal Generator</h1>
        <p>Import from XML, CSV, iCal and Plan UZ</p>
    </div>
    <div class="row">
        <div class="col-sm-2">
            <div class="container">
                <form:form action="addEvent" method="post" modelAttribute="calendarEvent">
                    <form:label path="title" cssErrorClass="error">Title:</form:label><br>
                    <form:input path="title" type="text" cssErrorClass="error"/><br>
                    <form:errors path="title" cssClass="errors" element="div"/>

                    <form:label path="startDate" cssErrorClass="error">Start time:</form:label><br>
                    <form:input path="startDate" type="text" placeholder="dd-mm-yyyy hh:mm:ss"
                                cssErrorClass="error"/><br>
                    <form:errors path="startDate" cssClass="errors" element="div"/>

                    <form:label path="endDate" cssErrorClass="error">End time:</form:label><br>
                    <form:input path="endDate" type="text" placeholder="dd-mm-yyyy hh:mm:ss"
                                cssErrorClass="error"/><br>
                    <form:errors path="endDate" cssClass="errors" element="div"/>

                    <form:label path="tag" cssErrorClass="error">Tag:</form:label><br>
                    <form:input path="tag" type="text" cssErrorClass="error"/><br>
                    <form:errors path="tag" cssClass="errors" element="div"/>

                    <form:label path="timeZone">Time zone:</form:label><br>
                    <form:select path="timeZone">
                        <option value="Europe/Warsaw">Europe/Warsaw</option>
                        <option value="America/Mexico_City">America/Mexico_City</option>
                    </form:select><br>

                    <form:label path="description" cssErrorClass="error">Description:</form:label><br>
                    <form:input path="description" type="text" cssErrorClass="error"/><br>
                    <form:errors path="description" cssClass="errors" element="div"/><br>

                    <input title="addEvent" type="submit" value="Add event">
                    <input title="clear" type="reset" value="Clear">
                </form:form>

                <br><br>

                <form:form method="POST" action="importFromFile" enctype="multipart/form-data">
                    <label>Import from file:</label>
                    <input type="file" name="file"><br>
                    <input type="submit" value="Import">
                </form:form><br><br><br>

                <label>Import from Plan UZ:</label><br>
                <select title="department">
                    <option selected="true" style="display:none;">Department</option>
                    <c:forEach items="${departmentsList}" var="departmentsList">
                        <option value="23">${departmentsList.name}</option>
                    </c:forEach>
                </select>
                <select title="branch">
                    <option selected="true" style="display:none;">Branch</option>
                </select>
                <select title="group">
                    <option selected="true" style="display:none;">Group</option>
                </select>
                <input title="importFromPlanUz" type="button" value="Import">
                <br><br>
                <input onclick="location.href='updateDatabase'" title="updateDatabase" type="button" value="Update database">

            </div>
        </div>

        <div class="col-sm-5">
            <div class="container">
                <table class="table table-hover">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Start time</th>
                        <th>End time</th>
                        <th>Tag</th>
                        <th>Time zone</th>
                        <th>Description</th>
                    </tr>
                    <c:forEach items="${calendarsList}" var="calendarEvent">
                        <tr>
                            <td>${calendarEvent.id}</td>
                            <td>${calendarEvent.title}</td>
                            <td>${calendarEvent.startDate.dayOfMonth}-${calendarEvent.startDate.monthOfYear}-${calendarEvent.startDate.year}
                                ${calendarEvent.startDate.hourOfDay}:${calendarEvent.startDate.minuteOfHour}:${calendarEvent.startDate.secondOfMinute}</td>
                            <td>${calendarEvent.endDate.dayOfMonth}-${calendarEvent.endDate.monthOfYear}-${calendarEvent.endDate.year}
                                ${calendarEvent.endDate.hourOfDay}:${calendarEvent.endDate.minuteOfHour}:${calendarEvent.endDate.secondOfMinute}</td>
                            <td>${calendarEvent.tag}</td>
                            <td>${calendarEvent.timeZone.ID}</td>
                            <td>${calendarEvent.description}</td>
                        </tr>
                    </c:forEach>
                </table><br>

                <form:form action="removeEvent" method="get" modelAttribute="eventToRemoveInfo">
                    <form:input path="id" type="text" placeholder="ID"/>
                    <input title="removeEvent" type="submit" value="Remove">
                </form:form><br>
                <input onclick="location.href='clearEvents'" title="clearEvents" type="button" value="Clear"><br><br>
            </div>
        </div>
    </div>

    <br><br>

    <div class="row">
        <div class="text-center">
            <input onclick="location.href='generateICal'" title="generateICal" type="button" value="Generate iCal">
            <input onclick="location.href='generateCsv'" title="generateCsv" type="button" value="Generate CSV">
        </div>
    </div>
</body>
</html>