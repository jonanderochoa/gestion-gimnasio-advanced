<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../includes/header.jsp" />
<main>
	<form:form action="save" method="post" commandName="ejercicio">
	<c:if test="${!empty ejercicio}">
		<form:hidden path="codigo" />
	</c:if>

	<div class="form-group">
		<form:label cssClass="control-label hidden-xs col-sm-2" path="ref">Referencia:</form:label>
		<div class="col-sm-7"><form:input placeholder="Introduzca la referencia" path="ref"	cssErrorClass="text-danger" cssClass="form-control" /></div>
		<div class="col-sm-3"><form:errors path="ref" cssClass="text-danger" /></div>
	</div>

	<div class="form-group">
		<form:label cssClass="control-label hidden-xs col-sm-2" path="maquina">Máquina:</form:label>
		<div class="col-sm-7"><form:input placeholder="Introduzca la máquina" path="maquina" cssErrorClass="text-danger" cssClass="form-control" /></div>
		<div class="col-sm-3"><form:errors path="maquina" cssClass="text-danger" /></div>
	</div>
	<div class="form-group">
		<form:label cssClass="control-label hidden-xs col-sm-2" path="descripcion">Descripción:</form:label>
		<div class="col-sm-7"><form:input placeholder="Introduzca la descripción" path="descripcion" cssErrorClass="text-danger" cssClass="form-control" /></div>
		<div class="col-sm-3"><form:errors path="descripcion" cssClass="text-danger" /></div>
	</div>

	<c:set var="men" value="Crear" />
	<c:if test="${ejercicio.codigo > 0}">
		<c:set var="men" value="Editar" />
	</c:if>
	<input type="submit" value=${men}>
</form:form> 
</main>
<jsp:include page="../includes/footer.jsp" />