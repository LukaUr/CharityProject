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
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
    <title>Form</title>
</head>
<body>
<header class="header--form-page">
    <%@include file="fragments/header.jsp" %>

    <section class="steps">
        <h2>Oddaj rzeczy, których już nie chcesz potrzebującym</h2>
        <h1>Wystarczą 4 proste kroki</h1>


        <div class="steps--container">
            <div class="steps--item">
                <span class="icon icon--hands"></span>
                <h3>Wybierz rzeczy</h3>
                <p>ubrania, zabawki, sprzęt i inne</p>
            </div>
            <div class="steps--item">
                <span class="icon icon--arrow"></span>
                <h3>Spakuj je</h3>
                <p>skorzystaj z worków na śmieci</p>
            </div>
            <div class="steps--item">
                <span class="icon icon--glasses"></span>
                <h3>Zdecyduj komu chcesz pomóc</h3>
                <p>wybierz zaufane miejsce</p>
            </div>
            <div class="steps--item">
                <span class="icon icon--courier"></span>
                <h3>Zamów kuriera</h3>
                <p>kurier przyjedzie w dogodnym terminie</p>
            </div>
        </div>
    </section>
</header>
<div class="form--steps">
    <div class="form--steps-instructions">
        <h3>Ważne!</h3>
        <h1>Uzupełnij szczegóły dotyczące Twoich rzeczy, dzięki temu będziemy wiedzieć komu je przekazać</h1>
    </div>

    <div class="form--steps-container">
        <form:form modelAttribute="donation" method="post" action="/donation">
        <div class="active" data-step="4">
            <p class="form--steps-counter">Krok 1/4</p>
            <h3>Zaznacz, co chcesz dodać:</h3>
            <c:forEach items="${categories}" var="category">
                <label class="category">
                    <c:out value="${category.name}"/>
                    <form:checkbox path="categories" value="${category.id}"/>
                    <span class="checkmark"></span>
                </label>
            </c:forEach>
            <div class="form-group--buttons">
                <button class="btn" type="submit">Dalej</button>
            </div>
        </div>
        <div>
            <p class="form--steps-counter">Krok 2/4</p>
            <p>Podaj liczbę 60l worków, do których spakowałeś/aś rzeczy</p>
            Liczba worków: <form:input type="number" path="quantity"/>
        </div>
        <div>
            <p class="form--steps-counter">Krok 3/4</p>
            <p>Wybierze organizację, której chcesz pomóc</p>
            <form:select path="institution" items="${institutions}" itemValue="id" itemLabel="name"/>
        </div>
        <div>
            <p class="form--steps-counter">Krok 4/4</p>
            <p>podaj adres oraz termin odbioru rzeczy przez kuriera</p>
            Address:
            <form:input path="zipCode"/>
            <form:input path="street"/>
            <form:input path="city"/>
            <br>

            <br>
            Pickup comment
            <form:textarea path="pickUpComment"/>
            <br>
            Pickup date
            <form:input type="date" path="pickUpDate"/>
            <br>
            Pickup time
            <form:input type="time" path="pickUpTime"/>
            <br>
            <form:button type="submit">dodaj</form:button>
            </form:form>
        </div>
        <div class="summary">
        </div>
    </div>
</div>


<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
