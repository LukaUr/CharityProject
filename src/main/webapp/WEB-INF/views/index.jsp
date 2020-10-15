<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title><fmt:message key="index.title"/></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <%@include file="fragments/header.jsp" %>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                <fmt:message key="index.slogan.start.helping"/><br/>
                <fmt:message key="index.slogan.give.unwanted.things"/>
            </h1>
        </div>
    </div>
</header>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>
                <c:out value="${bagsNumber}"/>
            </em>

            <h3><fmt:message key="index.stats.bags.received"/></h3>
            <p><fmt:message key="index.stats.bags.description"/></p>
        </div>

        <div class="stats--item">
            <em>
                <c:out value="${donationsNumber}"/>
            </em>
            <h3><fmt:message key="index.stats.donations.received"/></h3>
            <p><fmt:message key="index.stats.donations.description"/></p>
        </div>

    </div>
</section>

<section class="steps">
    <h2><fmt:message key="index.steps.title"/></h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3><fmt:message key="index.steps.choose.things"/></h3>
            <p><fmt:message key="index.steps.choose.things.description"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3><fmt:message key="index.steps.pack.it"/></h3>
            <p><fmt:message key="index.steps.pack.it.description"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3><fmt:message key="index.steps.decide.who.you.want.to.help"/></h3>
            <p><fmt:message key="index.steps.choose.trusted.organisation"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3><fmt:message key="index.order.courier"/></h3>
            <p><fmt:message key="index.order.courier.description"/></p>
        </div>
    </div>

    <a href="#" class="btn btn--large"><fmt:message key="index.sign.up"/></a>
</section>

<section class="about-us">
    <div class="about-us--text">
        <h2><fmt:message key="index.about.us"/></h2>
        <p><fmt:message key="index.about.us.description"/></p>
        <img src="<c:url value="/resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="/resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help">
    <h2><fmt:message key="index.help.who.we.help"/></h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p><fmt:message key="index.help.description"/></p>

        <ul class="help--slides-items">
            <c:forEach items="${institutions}" var="institution" varStatus="status">
                <c:if test="${status.count % 2 != 0}"><li></c:if>
                <div class="col">
                    <div class="title">
                        <c:out value="${institution.name}"/>
                    </div>
                    <div class="subtitle">
                        <c:out value="${institution.description}"/>
                    </div>
                </div>
                <c:if test="${status.count % 2 == 0}"></li></c:if>
            </c:forEach>
            <c:if test="${institutions.size() % 2 != 0}">
                <div></div>
                </li>
            </c:if>
        </ul>
    </div>

</section>

<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
