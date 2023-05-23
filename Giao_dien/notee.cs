<table id="example" class="display">
            <thead>
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Tên khách sạn</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Số lượng phòng</th>
                    <th>Ngày đặt</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                @foreach (var item in Model.hd)
                {
                    <tr class="invoice-row" data-invoice-id="@item.MaHoaDon">
                        <td class="mhd">@item.MaHoaDon</td>
                        <td>@item.khachsan.TenKhachSan</td>
                        <td>@item.HoTen</td>
                        <td>@item.SoDienThoai</td>
                        <td>@item.SoLuongPhong</td>
                        <td>@item.NgayDat</td>
                        <td>@item.TongTien</td>
                        <td>@item.ErrorPay.TenError</td>
                    </tr>
                    <tr class="details-row" data-invoice-id="@item.MaHoaDon">
                        <td colspan="5">
                            <div class="popup-content">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Mã chi tiết hóa đơn</th>
                                            <th>Ngày đến</th>
                                            <th>Ngày đi</th>
                                            <th>Đơn giá</th>
                                            <th>Tên Phòng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach (var c in Model.cthd.Where(a => a.MaHoaDon == item.MaHoaDon))
                                        {
                                            <tr>
                                                <td>@c.MaChiTietHoaDon</td>
                                                <td>@c.NgayDen</td>
                                                <td>@c.NgayDi</td>
                                                <td>@c.Gia</td>
                                                <td>@c.TenPhong</td>
                                            </tr>
                                        }
                                    </tbody>
                                </table>
                                <button class="close-btn">Đóng</button>
                            </div>
                        </td>
                    </tr>
                }
            </tbody>
            <tfoot>
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Tên khách sạn</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Số lượng phòng</th>
                    <th>Ngày đặt</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                </tr>
            </tfoot>
        </table>

        <div id="popup"></div>