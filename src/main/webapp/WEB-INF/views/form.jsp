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
    <title>Form</title>
</head>
<body>
<%@include file="fragments/header.jsp" %>

<section class="steps">
    <h2>Wystarczą 4 proste kroki</h2>

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
    <div class="stats">
        <h1>Ważne!</h1>
        <p>Uzupełnij szczegóły dotyczące Twoich rzeczy, dzięki temu będziemy wiedzieć komu je przekazać</p>
    </div>

<form:form modelAttribute="donation" method="post" action="/donation">

    <p>Krok 1/4</p>
    Zaznacz, co chcesz dodać:
<form:checkboxes path="categories" items="${categories}" itemValue="id" itemLabel="name"/>

    <p>Krok 2/4</p>
    <p>Podaj liczbę 60l worków, do których spakowałeś/aś rzeczy</p>
    Liczba worków: <form:input type="number" path="quantity"/>

    <p>Krok 3/4</p>
    <p>Wybierze organizację, której chcesz pomóc</p>
<form:select path="institution" items="${institutions}" itemValue="id" itemLabel="name"/>

    <p>Krok 4/4</p>
    <p>podaj adres oraz termin odbioru rzeczy przez kuriera</p>
    Address:
<form:input path="zipCode" />
<form:input path="street" />
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
<form:input type="time" path="pickUpTime" />
    <br>
    <form:button type="submit">dodaj</form:button>
</form:form>



<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
