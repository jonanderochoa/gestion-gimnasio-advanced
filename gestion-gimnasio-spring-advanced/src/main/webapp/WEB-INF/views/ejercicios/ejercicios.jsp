<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../includes/header.jsp"/>
	<main>
		<table class="table">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Maquina</th>
					<th>Descripcion</th>
					<th>Referencia</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test ="${not empty listadoEjercicios}">
						<c:forEach var="ejercicio" items="${listadoEjercicios}">
							<tr>
								<td>${ejercicio.codigo}</td>
								<td>${ejercicio.maquina}</td>
								<td>${ejercicio.descripcion}</td>
								<td>${ejercicio.ref}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>No se han encontrado ejercicios</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</main>
<jsp:include page="../includes/footer.jsp"/>