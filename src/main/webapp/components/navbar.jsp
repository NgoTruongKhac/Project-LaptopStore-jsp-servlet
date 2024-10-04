<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container mt-2 mb-2">
	<div class=row>

		<div class="col-md-3">
			<a href="index.jsp" class="text-decoration-none">LAPTOP STORE</a>
		</div>
		<div class="col-md-6">

			<form class="d-flex" role="search">
				<div class="w-75">
					<input class="form-control me-2 " type="search"
						placeholder="Tìm kiếm" aria-label="Search">
				</div>
				<button class="ms-2 btn btn-success " style="font-size: 13px; " type="submit" >Tìm
					kiếm</button>
			</form>

		</div>
		<div class="col-md-3 d-flex justify-content-evenly">

			<%
			HttpSession s = request.getSession(false);

			String loggedInUser = (s != null) ? (String) s.getAttribute("loggedInUser") : null;
			%>

			<%
			if (loggedInUser != null) {
			%>
			<div class="dropdown">
				<button id="accountIcon" type="button"
					class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"
					aria-expanded="false">
					<i class="bi bi-person"></i>
					<%=loggedInUser%>
				</button>

				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#"><i
							class="bi bi-person-vcard"></i> Xem thông tin</a></li>
					<li><a class="dropdown-item" href="#"><i
							class="bi bi-cart2"></i> Xem giỏ hàng</a></li>
					<li><a class="dropdown-item" href="#"><i
							class="bi bi-pencil-square"></i> Thay đổi thông tin</a></li>
					<li><a class="dropdown-item" href="#"
						onclick="confirmLogout()"><i class="bi bi-box-arrow-right"></i>
							Đăng xuất</a></li>
				</ul>
			</div>


      
			<script type="text/javascript">
			
			function confirmLogout() {		
				 Swal.fire({
				        title: 'Bạn có muốn đăng xuất?',
				        
				        icon: 'question',
				        showCancelButton: true,
				        confirmButtonColor: '#3085d6',
				        cancelButtonColor: '#d33',
				        confirmButtonText: 'Đồng ý',
				        cancelButtonText: 'Hủy bỏ'
				    }).then((result) => {
				        if (result.isConfirmed) {
				            // Nếu người dùng chọn "Đồng ý", chuyển hướng đến servlet logout
				            window.location.href = 'logout';
				        }
				    });
			}
			
			</script>

			<%
			} else {
			%>
			<a href="login.jsp" type="summit" class="btn btn-primary"><i
				class="bi bi-person"></i> Đăng Nhập</a>

			<%
			}
			%>



			<a href="register.jsp" type="summit" class="btn btn-primary"><i
				class="bi bi-person-plus"></i> Đăng ký</a>

		</div>

	</div>


</div>

<nav class="navbar navbar-expand-lg bg-info">
	<div class="container-fluid">

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-text">Danh Mục</span> <span
				class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#"><i class="fa-solid fa-house"></i>
						Trang Chủ</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"><i
						class="fa-solid fa-laptop"></i> Laptop Văn Phòng</a></li>
				<li class="nav-item"><a class="nav-link active" href="#"><i
						class="fa-solid fa-gamepad"></i> Laptop Gamming</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i
						class="bi bi-tags-fill"></i> Thương Hiệu </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Asus</a></li>
						<li><a class="dropdown-item" href="#">Lenovo</a></li>
						<li><a class="dropdown-item" href="#">Dell</a></li>
						<li><a class="dropdown-item" href="#">Acer</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"><i
						class='bx bxs-devices'></i> Phụ Kiện</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#"><i
								class='bx bx-mouse-alt'></i> chuột</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="fa-regular fa-keyboard"></i> bàn phím</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="fa-solid fa-headphones"></i> tai nghe</a></li>
						<li><a class="dropdown-item" href="#"><i
								class="bi bi-usb-drive"></i> USB</a></li>
					</ul></li>

			</ul>

		</div>
	</div>
</nav>