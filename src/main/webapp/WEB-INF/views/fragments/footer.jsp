<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>

</head>
<body>

<footer>
    <div class="contact">
        <h2><fmt:message key="footer.contact.us"/></h2>
        <h3><fmt:message key="footer.contact.form"/></h3>
        <form class="form--contact">
            <fmt:message key="footer.name" var="footerName"/>
            <fmt:message key="footer.surname" var="footerSurname"/>
            <fmt:message key="footer.message" var="footerMessage"/>
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="${footerName}"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="${footerSurname}"/></div>
            <div class="form-group"><textarea name="message" placeholder="${footerMessage}" rows="1"></textarea></div>
            <button class="btn" type="submit"><fmt:message key="footer.submit"/></button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="<c:url value="/resources/images/icon-facebook.svg"/>"/></a> <a href="#"
                                                                                            class="btn btn--small"><img
                src="<c:url value="/resources/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>
</footer>

</body>
</html>