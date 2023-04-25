﻿$(function () {
    var chat = $.connection.chat;
    loadClient(chat);
    var idphong = 1;
    $.connection.hub.start().done(function () {
        $('#btnSend').click(function () {
            sendMessage(chat);
        });

        $('.btnChatPhong').click(function () {
            var roomId = $(this).data('id');
            var tenphong = $(this).text();
            ChatGroup(chat, roomId, tenphong);
        });

        $('.btnChatAdmin').click(function () {
            var makh = $('#makh').val();
            roomId = $(this).data('id');
            tenphong = $(this).text();
            ChatAdmin(chat, roomId, tenphong, makh);
        });

        // Xử lý sự kiện nhấn phím Enter để gửi tin nhắn
        $('#txtMessage').keypress(function (e) {
            if (e.which === 13) { // Kiểm tra xem phím Enter đã được bấm chưa
                sendMessage(chat);
            }
        });

        // Lấy danh sách tin nhắn trong phòng chat và hiển thị lên
        var roomId = $('#idphong').val();
        if (roomId != null) {
            chat.server.getMessages(roomId);
        } else {
            var roomIdAdmin = $('#idphongadmin').val();
            var makh = $('#makh').val();
            chat.server.getMessagesAdmin(roomIdAdmin, makh);
        }
    });
});

function sendMessage(chat) {
    var roomId = $('#idphong').val();
    var roomIdAdmin = $('#idphongadmin').val();
    var msg = $('#txtMessage').val();
    var makh = $('#makh').val();

    if (msg == null || msg.trim() == '') {
        // Nếu msg rỗng, chuyển người dùng trở lại giao diện và kết thúc hàm.
        return;
    }

    if (roomId == null || roomId.trim() == '') {
        chat.server.message(roomIdAdmin, makh, msg);
    } else {
        chat.server.message(roomId, makh, msg);
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

function ChatAdmin(chat, roomId, tenphong, makh) {
    $('#idphong').val(null);
    $('#idphongadmin').val(roomId);
    $('#tenphong').text(tenphong);
    $('#contentMsg p').hide();
    $('#contentMsg li').hide(); // hide all messages
    $('#contentMsg li.admin').show(); // show only admin messages
    chat.server.getMessagesAdmin(roomId, makh);
}

/*-----------------------------------------------*/

var lastSenderId = null; // khởi tạo biến lưu trữ mã khách hàng ở vòng trước
var lastMessageTime = null; // khởi tạo biến lưu trữ thời gian tin nhắn cuối cùng

function loadClient(chat) {
    chat.client.message = function (tenphong, name, msg, makh, ngaygui) {
        var li = "";
        var me = "me";
        var you = "you";
        var messageTime = new Date(ngaygui).getTime(); // chuyển đổi ngày gửi tin nhắn thành thời gian (đơn vị: milliseconds)

        // Kiểm tra nếu đã đủ 1 giờ kể từ lần gửi tin nhắn cuối cùng
        if (lastMessageTime && (messageTime - lastMessageTime) >= (60 * 60 * 1000)) {
            // Nếu đã đủ 1 giờ, in ra thời gian của tin nhắn mới
            var messageDate = new Date(messageTime);
            var messageDateString = messageDate.toLocaleString();
            var messageTimeHTML = '<p class= "timenow" >' + messageDateString + '</p>';
            $('#contentMsg').append(messageTimeHTML);
        }

        if (makh == $('#makh').val()) { // người gửi tin nhắn là người dùng đang truy cập
            li = "<li data-sender='" + makh + "' class = '" + me + "' ><span>" + msg + "</span></li>";
        } else {
            li = "<li data-sender='" + makh + "' class = '" + you + "' ><p>"
                + (makh !== lastSenderId ? name + ":" : "") + "</p> <span>"
                + msg + "</span></li>";
        }
        $('#contentMsg').append(li);

        lastSenderId = makh; // lưu mã khách hàng hiện tại cho lần so sánh ở vòng sau
        lastMessageTime = messageTime; // lưu lại thời gian gửi tin nhắn cuối cùng

        // Cuộn thanh cuộn xuống tin nhắn mới nhất
        var messagesContainer = $('#contentMsg');
        messagesContainer.scrollTop(messagesContainer[0].scrollHeight);
    }
}