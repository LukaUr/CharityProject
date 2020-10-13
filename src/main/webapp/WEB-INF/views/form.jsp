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
        <form:form modelAttribute="donation" method="post" action="/donation" name="donation">
            <p class="form--steps-counter">Krok <span>1</span>/4</p>
            <div class="active" data-step="1">
                <h3>Zaznacz, co chcesz dodać:</h3>
                <c:forEach items="${categories}" var="category">
                    <label class="category">
                        <span><c:out value="${category.name}"/></span>
                        <form:checkbox path="categories" value="${category.id}"/>
                        <span class="checkmark"></span>
                    </label>
                </c:forEach>
            </div>

            <div data-step="2">
                <h3>Podaj liczbę 60l worków, do których spakowałeś/aś rzeczy</h3>
                <div class="form-group">
                    <span class="form--steps-text">Liczba 60l worków: </span> <form:input type="number"
                                                                                          path="quantity"/>
                </div>
            </div>

            <div data-step="3">
                <h3>Wybierz organizację, której chcesz pomóc</h3>
                <div class="form-group--dropdown">
                    <form:select path="institution" items="${institutions}" itemValue="id" itemLabel="name"
                                 class="select"/>
                </div>
            </div>

            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera</h3>
                <div class="form-section">
                    <div class="form-section--columns">
                        <div>
                            <div class="form-group">
                                <h4>Address:</h4>
                                <label>
                                    <span class="form--steps-text">Ulica</span>
                                    <form:input path="street"/>
                                </label>
                                <label>
                                    <span class="form--steps-text">Miasto</span>
                                    <form:input path="city"/></label>
                                <label><span class="form--steps-text">Kod pocztowy</span>
                                    <form:input path="zipCode"/>
                                </label>
                                <label>
                                    <span class="form--steps-text">Numer telefonu</span>
                                    <form:input path="phoneNumber"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <h4>Termin odbioru:</h4>
                                <label>
                                    <span class="form--steps-text">Data odbioru</span>
                                    <form:input type="date" path="pickUpDate"/>
                                </label>
                                <label>
                                    <span class="form--steps-text">Godzina odbioru</span>
                                    <form:input type="time" path="pickUpTime"/>
                                </label>
                                <label>
                                    <span class="form--steps-text">Uwagi dla kuriera</span>
                                    <form:textarea path="pickUpComment"/>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="summary" data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>
                <h4>Oddajesz:</h4>
                <div class="info-box-columns">
                    <div class="icon icon-bag"></div>
                    <div class="info-box-rows">
                        <div class="info-box-text center">Liczba worków: <span id="infoNumberOfBags"></span></div>
                        <div class="info-box-columns">
                            <div class="info-box-text">Zawartość:</div>
                            <div id="infoCategories" class="info-box-rows"></div>
                        </div>
                    </div>
                </div>
                <div class="info-box-columns">
                    <div class="icon icon-hand"></div>
                    <div class="info-box-text center">Dla organizacji: <span id="infoInstitution"></span></div>
                </div>
                <div class="info-box-columns">
                    <div class="info-box-rows">
                        <h4>Adres:</h4>
                        <div id="infoStreet" class="info-box-text"></div>
                        <div id="infoCity" class="info-box-text"></div>
                        <div id="infoZipCode" class="info-box-text"></div>
                        <h4>Numer telefonu:</h4>
                        <div id="infoPhoneNumber" class="info-box-text"></div>
                    </div>
                    <div class="info-box-rows">
                        <h4>Termin odbioru:</h4>
                        <div id="infoPickUpDate" class="info-box-text"></div>
                        <div id="infoPickUpTime" class="info-box-text"></div>
                        <div id="infoPickUpComment" class="info-box-text"></div>
                    </div>
                </div>

            </div>
        </form:form>
        <div class="form-group--buttons active">
            <button class="btn prev-step" type="submit">Wróć</button>
            <button class="btn next-step" type="submit">Dalej</button>
            <button class="btn agree-btn hidden" type="submit" form="donation">Potwierdzam</button>
        </div>
    </div>
</div>


<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
