<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../includes/header.jsp" />
<main>
<table class="table">
	<thead>
		<tr>
			<th>Codigo</th>
			<th>Fecha</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty listadoEntrenamientos}">
				<c:forEach var="entrenamiento" items="${listadoEntrenamientos}">
					<tr>
						<td>${entrenamiento.codigo}</td>
						<td>${entrenamiento.fecha}</td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-default"><a href="#">Editar</a></button>
								<button type="button" class="btn btn-default"><a href="#">Borrar</a></button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td>No se han encontrado entrenamiento</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
</main>
<jsp:include page="../includes/footer.jsp" />