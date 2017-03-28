<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:include page="../includes/header.jsp" />
<main>
<div class="container">
	<div class="table-responsive">
		<table class="table center">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nombre</th>
					<th>Apellidos</th>
					<th>User</th>
					<th>Password</th>
					<th>email</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty listadoUsuarios}">
						<c:forEach var="usuario" items="${listadoUsuarios}">
							<tr>
								<td>${usuario.codigo}</td>
								<td>${usuario.nombre}</td>
								<td>${usuario.apellidos}</td>
								<td>${usuario.user}</td>
								<td>${usuario.pass}</td>
								<td>${usuario.email}</td>
								<td>
									<div class="btn-group">
										<a class="btn btn-default" href="<c:url value='usuarios/${usuario.codigo}'/>">Editar</a>
										<a class="btn btn-default" href="<c:url value='usuarios/deleteUsuario'/>">Borrar</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td>No se han encontrado usuarios</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
</main>
<jsp:include page="../includes/footer.jsp" />