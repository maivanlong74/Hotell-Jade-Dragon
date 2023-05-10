// Xử lý thông tin địa điểm khi click vào bản đồ
map.on('singleclick', function (evt) {
    var maks = $('#maks_map').val();

    if (maks == null || maks.trim() == '') {
        $('#DangKy_Map').css('z-index', '-999');
    } else {
        handlePosition();
    }
});

function handlePosition() {
    var KinhDo = $('#KinhDo').val();
    var tenks = $('#ViDo').val();
    var div_form = document.getElementById("DangKy_Map");
                var info = document.getElementById("info_ksks");
                if (info) {
                    info.style.background = "rgba(0, 0, 0, 0.7)";
                    div_form.style.zIndex = "999";
                        info.innerHTML = `
                            <button>Chỉ đường</button>
                        `;
                    }
}