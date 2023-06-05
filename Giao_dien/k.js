$(document).ready(function () {
    $("#click-phong").click(function () {
        var maPhong = $(this).data("maphong");
        var maKhachSan = $(this).data("maks");
        $.ajax({
            type: "GET",
            url: "/TrangKhachSan/AnhPhong",
            data: { maph: maPhong, maks: maKhachSan },
            
            success: function (data) {
                // Xử lý dữ liệu trả về từ action và đưa vào mã HTML
                $(".list_anhphong").empty();
                $.each(data, function (index, item) {
                    var imgElement = $("<img>").attr("src", item.LinkAnhPhong).attr("alt", "");
                    var anhPhongItem = $("<div>").addClass("anhphong-item").append(imgElement);
                    $(".list_anhphong").append(anhPhongItem);
                });
                $(".anhphongks").show();
            },
            error: function () {
                console.log("Error occurred");
            }
        });
    });

    $(".close-anh button").click(function () {
        $(".anhphongks").hide();
    });
});