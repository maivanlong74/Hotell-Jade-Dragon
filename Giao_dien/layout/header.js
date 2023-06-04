let header =  document.querySelector('.header');
header.innerHTML = `
<nav class="header__nav">
<div class="header__nav__container">
  <div class="grid wide">
    <div class="row">
      <div class="l-3 m-6 c-8">
        <a href="#">
          <div class="header__nav__container--logo">
            Jade dradon
          </div>
        </a>
      </div>
      <div class="l-6 hide-on-tablet_mobile">
        <ul class="header__nav__container--list">
          <li><a href="trangchu.html">Trang chủ</a></li>
          <li><a href="khachsan.html">Khách sạn</a></li>
          <li><a href="nhanxet.html">Nhận xét</a></li>
          <li><a href="">Liên hệ</a></li>
      </ul>
      </div>              
      <div class="l-3 m-6 c-4">
        <i class="fas fa-bars list-tablet-mobile" id="menu_open"></i>
        <div class="header__nav__container--search">
          <i class="fas fa-search" id="search"></i>
          <br />
          <input type="text" placeholder="Search..." />
        </div>
      </div>
    </div>
  </div>
</div>
</nav>

<div class="header__menu">
<div class="header__menu__overlay"></div>
<div class="header__menu__body--content">
  <ul>
    <li><a href="trangchu.html">Trang chủ</a></li>
    <li><a href="khachsan.html">Khách sạn</a></li>
    <li><a href="nhanxet.html">Nhận xét</a></li>
    <li><a href="">Liên hệ</a></li>
  </ul>
  <i class="fas fa-times" id="menu_close"></i>
</div>
</div>
<div class="scroll-top">
<i class="fas fa-arrow-up"></i>
</div>
`