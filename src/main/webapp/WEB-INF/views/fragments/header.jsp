<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>

</head>
<body>

    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border"><fmt:message key="header.nav.login"/> </a></li>
            <li><a href="#" class="btn btn--small btn--highlighted"><fmt:message key="header.nav.register"/></a></li>
        </ul>

        <ul>
            <li><a href="#" class="btn btn--without-border active"><fmt:message key="header.nav.start"/></a></li>
            <li><a href="#" class="btn btn--without-border"><fmt:message key="header.nav.about"/></a></li>
            <li><a href="#" class="btn btn--without-border"><fmt:message key="header.nav.about.us"/></a></li>
            <li><a href="#" class="btn btn--without-border"><fmt:message key="header.nav.organisations"/></a></li>
            <li><a href="#" class="btn btn--without-border"><fmt:message key="header.nav.contact"/></a></li>
            <li><a href="?lang=en" class="btn btn--without-border">EN </a></li>
            <li><a href="?lang=pl" class="btn btn--without-border">PL</a></li>
        </ul>
    </nav>

</body>
</html>