<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/f8ebbde80f.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container main bg-light">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/admin/">ADMIN</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/admin/">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/customers">Customers</a></li>
				</ul>
			</div>
		</nav>
		<div class="d-flex p-2">
			<h2>Albums</h2>
			<a href="/admin/album/create"><i class="far fa-plus-square fa-2x"></i></a>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Date</th>
					<th scope="col">Status</th>
					<th scope="col">Artist Id</th>
					<th scope="col">Inventory</th>
					<th scope="col">Genre</th>
					<!-- <th scope="col"></th> -->
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${albums}" var="album">
					<tr>
						<td>${album.name}</td>
						<td>${album.price}</td>
						<td><fmt:formatDate type="date" value="${album.date}" /></td>
						<td>${album.status}</td>
						<td>${album.artist.name}</td>
						<td>${album.inventory}</td>
						<c:choose>
							<c:when test="${album.genre.name == null}">
								<td>Not Specified</td>
							</c:when>
							<c:otherwise>
								<td>${album.genre.name}</td>
							</c:otherwise>
						</c:choose>


						<td><a href="/admin/album/${album.id}"><i
								class="far fa-edit"></i></a></td>
						<td><a href="/admin/album/delete/${album.id}"><i
								class="fas fa-trash"></i></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex p-2">
			<h2>Songs</h2>
			<a href="/admin/song/create"><i class="far fa-plus-square fa-2x"></i></a>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Album</th>
					<th scope="col">Artist</th>
					<th scope="col">Inventory</th>
					<!-- <th scope="col"></th> -->
					<!-- <th scope="col"></th> -->
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${songs}" var="song">
					<tr>
						<td>${song.name}</td>
						<td>${song.price}</td>
						<td>${song.album.name}</td>
						<td>${song.artist.name}</td>
						<td>${song.inventory}</td>


						<td><a href="/admin/song/${song.id}"><i
								class="far fa-edit"></i></a></td>
						<td><a href="/admin/song/delete/${song.id}"><i
								class="fas fa-trash"></i></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex p-2">
			<h2>Artists</h2>
			<a href="/admin/createArtist"><i class="far fa-plus-square fa-2x"></i></a>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Location</th>
					<!-- <th scope="col"></th> -->
					<!-- <th scope="col"></th> -->
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${artists}" var="artist">
					<tr>
						<td>${artist.name}</td>
						<td>${artist.location}</td>

						<td><a href="/admin/updateartist/${artist.id}"><i
								class="far fa-edit"></i></a></td>
						<td><a href="/admin/deleteartist/${artist.id}"><i
								class="fas fa-trash"></i></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div class="d-flex p-2">
			<h2>Genre</h2>
			<a href="/admin/createGenre"><i class="far fa-plus-square fa-2x"></i></a>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Description</th>
					<!-- <th scope="col"></th> -->
					<!-- <th scope="col"></th> -->
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${genres}" var="genre">
					<tr>
						<td>${genre.name}</td>
						<td>${genre.description}</td>

						<td><a href="/admin/updategenre/${genre.id}"><i
								class="far fa-edit"></i></a></td>
						<td><a href="/admin/deletegenre/${genre.id}"><i
								class="fas fa-trash"></i></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>