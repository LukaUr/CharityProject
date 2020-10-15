<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 05.10.2020
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <title><fmt:message key="form.title"/></title>
</head>
<body>
<header class="header--form-page">
    <%@include file="fragments/header.jsp" %>

    <section class="steps">
        <h2><fmt:message key="index.slogan.give.unwanted.things"/></h2>
        <h1><fmt:message key="index.steps.title"/></h1>


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
    </section>
</header>
<div class="form--steps">
    <div class="form--steps-instructions">
        <h3><fmt:message key="form.important"/></h3>
        <h1><fmt:message key="form.important.description"/></h1>
    </div>

    <div class="form--steps-container">
        <form:form modelAttribute="donation" method="post" action="/donation" name="donation">
            <p class="form--steps-counter"><fmt:message key="form.step"/> <span>1</span>/4</p>
            <div class="active" data-step="1">
                <h3><fmt:message key="form.step.select.things.to.give"/></h3>
                <c:forEach items="${categories}" var="category">
                    <label class="category">
                        <span><c:out value="${category.name}"/></span>
                        <form:checkbox path="categories" value="${category.id}"/>
                        <span class="checkmark"></span>
                    </label>
                </c:forEach>
            </div>

            <div data-step="2">
                <h3><fmt:message key="form.step.enter.number.of.bags"/></h3>
                <div class="form-group">
                    <span class="form--steps-text"><fmt:message key="form.step.number.of.bags"/> </span> <form:input type="number"
                                                                                          path="quantity"/>
                </div>
            </div>

            <div data-step="3">
                <h3><fmt:message key="form.step.choose.organisation"/></h3>
                <div class="form-group--dropdown">
                    <form:select path="institution" items="${institutions}" itemValue="id" itemLabel="name"
                                 class="select"/>
                </div>
            </div>

            <div data-step="4">
                <h3><fmt:message key="form.step.provide.address"/></h3>
                <div class="form-section">
                    <div class="form-section--columns">
                        <div>
                            <div class="form-group">
                                <h4><fmt:message key="form.step.address"/></h4>
                                <label>
                                    <span class="form--steps-text"><fmt:message key="form.step.address.street"/></span>
                                    <form:input path="street"/>
                                </label>
                                <label>
                                    <span class="form--steps-text"><fmt:message key="form.step.address.city"/></span>
                                    <form:input path="city"/></label>
                                <label><span class="form--steps-text"><fmt:message key="form.step.address.zipcode"/></span>
                                    <form:input path="zipCode"/>
                                </label>
                                <label>
                                    <span class="form--steps-text"><fmt:message key="form.step.address.phone"/></span>
                                    <form:input path="phoneNumber"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <h4><fmt:message key="form.step.pickup.details"/></h4>
                                <label>
                                    <span class="form--steps-text"><fmt:message key="form.step.pickup.date"/></span>
                                    <form:input type="date" path="pickUpDate"/>
                                </label>
                                <label>
                                    <span class="form--steps-text"><fmt:message key="form.step.pickup.time"/></span>
                                    <form:input type="time" path="pickUpTime"/>
                                </label>
                                <label>
                                    <span class="form--steps-text"><fmt:message key="form.step.pickup.courier.info"/></span>
                                    <form:textarea path="pickUpComment"/>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="summary" data-step="5">
                <h3><fmt:message key="form.summary"/></h3>
                <h4><fmt:message key="form.summary.you.give"/></h4>
                <div class="info-box-columns">
                    <div class="icon icon-bag"></div>
                    <div class="info-box-rows">
                        <div class="info-box-text center"><fmt:message key="form.summary.number.of.bags"/> <span id="infoNumberOfBags"></span></div>
                        <div class="info-box-columns">
                            <div class="info-box-text"><fmt:message key="form.summary.content"/></div>
                            <div id="infoCategories" class="info-box-rows"></div>
                        </div>
                    </div>
                </div>
                <div class="info-box-columns">
                    <div class="icon icon-hand"></div>
                    <div class="info-box-text center"><fmt:message key="form.summary.for.organisation"/> <span id="infoInstitution"></span></div>
                </div>
                <div class="info-box-columns">
                    <div class="info-box-rows">
                        <h4><fmt:message key="form.summary.address"/></h4>
                        <div id="infoStreet" class="info-box-text"></div>
                        <div id="infoCity" class="info-box-text"></div>
                        <div id="infoZipCode" class="info-box-text"></div>
                        <h4><fmt:message key="form.summary.phone.number"/></h4>
                        <div id="infoPhoneNumber" class="info-box-text"></div>
                    </div>
                    <div class="info-box-rows">
                        <h4><fmt:message key="form.summary.pickup.details"/></h4>
                        <div id="infoPickUpDate" class="info-box-text"></div>
                        <div id="infoPickUpTime" class="info-box-text"></div>
                        <div id="infoPickUpComment" class="info-box-text"></div>
                    </div>
                </div>

            </div>
        </form:form>
        <div class="form-group--buttons active">
            <button class="btn prev-step" type="submit"><fmt:message key="form.button.back"/></button>
            <button class="btn next-step" type="submit"><fmt:message key="form.button.next"/></button>
            <button class="btn agree-btn hidden" type="submit" form="donation"><fmt:message key="form.button.confirm"/></button>
        </div>
    </div>
</div>


<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
