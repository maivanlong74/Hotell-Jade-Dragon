$(function () {
    var danhgia = $.connection.danhgia;
    loadClient(danhgia);
    const stars = document.querySelectorAll(".star");
    const ratingValue = document.querySelector(".rating-value");

    $.connection.hub.start().done(function () {
        $('#star1').click(function () {
            var sosao = $(this).data('rating');
            ChonSao(danhgia, sosao);
        });

        $('#star2').click(function () {
            var sosao = $(this).data('rating');
            ChonSao(danhgia, sosao);
        });

        $('#star3').click(function () {
            var sosao = $(this).data('rating');
            ChonSao(danhgia, sosao);
        });

        $('#star4').click(function () {
            var sosao = $(this).data('rating');
            ChonSao(danhgia, sosao);
        });

        $('#star5').click(function () {
            var sosao = $(this).data('rating');
            ChonSao(danhgia, sosao);
        });

        var maks = $('#maks').val();
        var makh = $('#makh').val();
        danhgia.server.get_DanhGia(maks, makh);
    });
});

function ChonSao(danhgia, sosao) {
    var sao = $('#so_sao').val();
    var maks = $('#maks').val();
    var makh = $('#makh').val();

    if (makh == null || makh.trim() == '') {
        alert('Bạn cần đăng nhập để đánh giá');
    } else {
        if (sao == null || sao.trim() == '') {
            danhgia.server.create_DanhGia(sosao, maks, makh);
        } else {
            alert('Bạn đã đánh giá ' + sao + ' sao rồi. \n'
                + 'Bạn không thể thay đổi đánh giá nữa');
            return;
        }
    }
}
/*--------------------------------*/

function loadClient(danhgia) {
    danhgia.client.danhGia = function (sosao, maks, makh) {
        for (let i = 0; i < sosao; i++) {
            stars[i].classList.add('rated');
        }
    }
}