﻿$(function () {
    var chat = $.connection.chat;
    loadClient(chat);
    loadGroup(chat);

    $.connection.hub.start().done(function () {
        console.log("check", $('.btnChatPhong'))
        $('#btnSend').click(function () {
            sendMessage(chat);
        });

        $('.btnUser').click(function () {
            var MaNguoiNhan = $(this).data('id');
            var TenNguoiNhan = $(this).text();
            var MaNguoiGui = $('#makh').val();
            ChatUser(chat, MaNguoiNhan, TenNguoiNhan, MaNguoiGui);
        });

        // Đổi phòng
        $('#Create_Room').on("click", "button", (function () {
            var roomId = $(this).data('id');

            var tenphong = $(this).text();
            ChatGroup(chat, roomId, tenphong);
        }));

        // Xử lý sự kiện nhấn phím Enter để gửi tin nhắn
        $('#txtMessage').keypress(function (e) {
            if (e.which === 13) { // Kiểm tra xem phím Enter đã được bấm chưa
                sendMessage(chat);
            }
        });

        // Lấy danh sách tin nhắn trong phòng chat và hiển thị lên
        var roomId = $('#idphong').val();
        if (roomId == null || roomId.trim() == '') {
            var idnhan = $('#idUser').val();
            var idgui = $('#makh').val();
            chat.server.getMessagesAdmin(idnhan, idgui);
        } else {
            chat.server.getMessages(roomId);
        }

        //Lấy danh sách phòng
        chat.server.getTaoMoi();

    });
});

function sendMessage(chat) {
    var roomId = $('#idphong').val();
    var IdNhan = $('#idUser').val();
    var msg = $('#txtMessage').val();
    var makh = $('#makh').val();

    if (msg == null || msg.trim() == '') {
        // Nếu msg rỗng, chuyển người dùng trở lại giao diện và kết thúc hàm.
        return;
    }

    if (roomId == null || roomId.trim() == '') {
        chat.server.message(IdNhan, makh, msg, true);
    } else {
        chat.server.message(roomId, makh, msg, false);
    }

    $('#txtMessage').val('').focus();
}

function ChatGroup(chat, roomId, tenphong) {
    $('#idphong').val(roomId);
    $('#tenphong').text(tenphong);
    $('#contentMsg p').hide();
    $('#contentMsg li').hide(); // hide all messages
    $('#contentMsg li.admin').show(); // show only admin messages

    chat.server.getMessages(roomId);
}

function ChatUser(chat, MaNguoiNhan, TenNguoiNhan, MaNguoiGui) {

    $('#idphong').val("");
    $('#idUser').val(MaNguoiNhan);
    $('#tenphong').text(TenNguoiNhan);
    $('#contentMsg p').hide();
    $('#contentMsg li').hide(); // hide all messages
    $('#contentMsg li.admin').show(); // show only admin messages

    chat.server.getMessagesAdmin(MaNguoiNhan, MaNguoiGui);
}

/*-----------------------------------------------*/

var lastSenderId = null; // khởi tạo biến lưu trữ mã khách hàng ở vòng trước
var lastMessageTime = null; // khởi tạo biến lưu trữ thời gian tin nhắn cuối cùng

function loadClient(chat) {
    chat.client.message = function (name, msg, makh, ngaygui, matinnhan) {
        var MaKhachHang = $('#makh').val();
        var li = "";
        var messageTime = new Date(ngaygui).getTime(); // chuyển đổi ngày gửi tin nhắn thành thời gian (đơn vị: milliseconds)
        var link = "/TinNhan/DeleteTinNhan?id=" + matinnhan + "&gui=" + makh + "&makh=" + MaKhachHang;
        var linkanh = "/Style/img/icon/icon-X.jpg";

        // Kiểm tra nếu đã đủ 1 giờ kể từ lần gửi tin nhắn cuối cùng
        if (lastMessageTime && (messageTime - lastMessageTime) >= (60 * 60 * 1000)) {
            // Nếu đã đủ 1 giờ, in ra thời gian của tin nhắn mới
            var messageDate = new Date(messageTime);
            var messageDateString = messageDate.toLocaleString();
            var messageTimeHTML = '<p class= "timenow" >' + messageDateString + '</p>';
            $('#contentMsg').append(messageTimeHTML);

            if (makh == $('#makh').val()) { // người gửi tin nhắn là người dùng đang truy cập
                li = "<li data-sender='" + makh + "' class = 'me' >" +
                    "<div class='Delete'><a href='" + link + "'>" +
                    "<img src='" + linkanh + "' title='Xóa tin nhắn'/>" +
                    "</a ></div > " +
                    "<span>" + msg + "</span></li > ";
            } else {
                li = "<li data-sender='" + makh + "' class = 'you' ><p>"
                    + name + "</p><span>" + msg + "</span></li>";
            }
            $('#contentMsg').append(li);
        } else {
            if (makh == $('#makh').val()) { // người gửi tin nhắn là người dùng đang truy cập
                li = "<li data-sender='" + makh + "' class = 'me' >" +
                    "<div class='Delete'><a href='" + link + "'>" +
                    "<img src='" + linkanh + "' title='Xóa tin nhắn'/>" +
                    "</a ></div > " +
                    "<span>" + msg + "</span></li>";
            } else {
                li = "<li data-sender='" + makh + "' class = 'you' ><p>"
                    + (makh !== lastSenderId ? name + ":" : "") + "</p>" +
                    "<span>" + msg + "</span></li>";
            }
            $('#contentMsg').append(li);
        }

        lastSenderId = makh; // lưu mã khách hàng hiện tại cho lần so sánh ở vòng sau
        lastMessageTime = messageTime; // lưu lại thời gian gửi tin nhắn cuối cùng

        // Cuộn thanh cuộn xuống tin nhắn mới nhất
        var messagesContainer = $('#contentMsg');
        messagesContainer.scrollTop(messagesContainer[0].scrollHeight);
    }
}

function loadGroup(chat) {
    var linkanh = "/Style/img/icon/icon-X.jpg";
    chat.client.taoMoi = function (maphong, tenphong) {
        var ht = "<li><button type='button' class='btnChatPhong' data-id='" + maphong + "'>" +
            tenphong + "</button></li>"
        $('#Create_Room').append(ht);
    }
}