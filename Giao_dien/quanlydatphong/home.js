let nav = document.querySelector('.sidebar');
nav.innerHTML= `
<header>
<div class="image-text">
    <span class="image">
        <img src="logo.png" alt="">
    </span>

    <div class="text logo-text">
        <span class="name">ADMIN</span>
        <span class="profession">Jade Dragon</span>
    </div>
</div>

<i class='bx bx-chevron-right toggle'></i>
</header>

<div class="menu-bar">
<div class="menu">

    <li class="search-box">
        <i class='bx bx-search icon'></i>
        <input type="text" placeholder="Search...">
    </li>

    <ul class="menu-links">
        <li class="nav-link">
            <a href="home.html">
                <i class='bx bx-home-alt icon'></i>
                <span class="text nav-text">Trang chủ</span>
            </a>
        </li>

        <li class="nav-link">
            <a href="khachhang.html">
                <i class='bx bx-user-x icon'></i>
                <span class="text nav-text">Quản lý khách hàng</span>
            </a>
        </li>

        <li class="nav-link">
            <a href="khachsan.html">
                <i class='bx bx-camera-home icon'></i>
                <span class="text nav-text">Quản lý khách sạn</span>
            </a>
        </li>

        <li class="nav-link">
            <a href="lichsu.html">
                <i class='bx bx-pie-chart-alt icon'></i>
                <span class="text nav-text">Thống kê</span>
            </a>
        </li>

        <li class="nav-link">
            <a href="phanhoi.html">
                <i class='bx bx-comment icon'></i>
                <span class="text nav-text">Phản hồi</span>
            </a>
        </li>

        <li class="nav-link">
            <a href="phanhoi.html">
                <i class='bx bx-send icon'></i>
                <span class="text nav-text">Tin nhắn</span>
            </a>
        </li>

        <li class="nav-link">
            <a href="phanhoi.html">
                <i class='bx bx-select-multiple icon'></i>
                <span class="text nav-text">Xác Nhận</span>
            </a>
        </li>
    </ul>
</div>

<div class="bottom-content">
    <li class="">
        <a href="#">
            <i class='bx bx-log-out icon'></i>
            <span class="text nav-text">Thoát</span>
        </a>
    </li>

</div>
</div>
`