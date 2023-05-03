var map;
function initMap() {
    // Thiết lập bản đồ
    map = new ol.Map({
        target: 'map',
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM(),
            }),
        ],
    });
    // ------------------------------
    if ('geolocation' in navigator) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var pos = ol.proj.fromLonLat([position.coords.longitude, position.coords.latitude]);
            var data = {
                latitude: position.coords.latitude,
                longitude: position.coords.longitude
            };
            $.ajax({
                type: 'POST',
                url: '/Admin/QLKhachSan/Create',
                data: JSON.stringify(data),
                contentType: 'application/json',
                success: function () {
                    console.log('Đã gửi vị trí đến máy chủ');
                }
            });
            var marker = new ol.Feature({
                geometry: new ol.geom.Point(pos)
            });
            var markerSource = new ol.source.Vector({
                features: [marker]
            });
            var markerLayer = new ol.layer.Vector({
                source: markerSource
            });
            map.addLayer(markerLayer);
            map.getView().setCenter(pos);
            map.getView().setZoom(18);
        });
    } else {
        alert('Định vị địa lý không được trình duyệt của bạn hỗ trợ');
    }

    // Thêm control để xác định vị trí hiện tại
    var geolocation = new ol.Geolocation({
        trackingOptions: {
            enableHighAccuracy: true
        },
        projection: map.getView().getProjection()
    });
    var positionFeature = new ol.Feature();
    positionFeature.setStyle(new ol.style.Style({
        image: new ol.style.Circle({
            radius: 6,
            fill: new ol.style.Fill({
                color: '#3399CC'
            }),
            stroke: new ol.style.Stroke({
                color: '#fff',
                width: 2
            })
        })
    }));
    // Tạo một đối tượng marker
    var marker = new ol.Feature({
        geometry: new ol.geom.Point(ol.proj.fromLonLat([0, 0]))
    });
    marker.setStyle(new ol.style.Style({
        image: new ol.style.Icon({
            anchor: [0.5, 1],
            src: 'https://openlayers.org/en/latest/examples/data/icon.png'
        })
    }));

    // Thêm marker vào bản đồ
    var markerLayer = new ol.layer.Vector({
        source: new ol.source.Vector({
            features: [marker]
        })
    });
    map.addLayer(markerLayer);

    // Xử lý thông tin địa điểm khi click vào bản đồ
    map.on('singleclick', function (evt) {
        var clickedCoordinate = evt.coordinate;
        var lonlat = ol.proj.toLonLat(clickedCoordinate);
        // Di chuyển marker tới vị trí click
        marker.getGeometry().setCoordinates(clickedCoordinate);
        handlePosition(lonlat, evt, clickedCoordinate);
    });

    function handlePosition(lonlat, evt, clickedCoordinate) {
        // Tìm kiếm địa điểm gần vị trí chọn nhất và hiển thị thông tin lên bản đồ
        var url = `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lonlat[1]}&lon=${lonlat[0]}&addressdetails=1&zoom=18`;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                var address = data.address;
                var houseNumber = address.house_number || '';
                var road = address.road || '';
                var suburb = address.suburb || address.neighbourhood || '';
                var city = address.city || address.town || address.village || '';
                var state = address.state || '';
                var displayName = `${houseNumber} ${road}, ${suburb}, ${city}, ${state}`;

                var latitude = lonlat[1];
                var longitude = lonlat[0];

                $('#DiaChi').val(displayName);
                $('#KhuVuc').val(road);
                $('#KinhDo').val(longitude);
                $('#ViDo').val(latitude);

                var MuiTen = document.querySelector('.MuiTen');
                var mapElement = document.getElementById("body");
                MuiTen.classList.remove("danhmucsp");
                mapElement.classList.add("danhmucsp");
                var danhmucsp = document.querySelector('.danhmucsp');
                if (danhmucsp) {
                    danhmucsp.scrollIntoView({ behavior: 'smooth' });
                }
            })
            .catch(error => {
                console.error("Lỗi khi tìm nạp dữ liệu:", error);
            });
    }

    // Thêm control zoom slider
    var zoomSlider = new ol.control.ZoomSlider();
    map.addControl(zoomSlider);
    // Thêm control full screen
    var fullScreen = new ol.control.FullScreen();
    map.addControl(fullScreen);

    /*--------*/
    // Lấy các phần tử input và button tìm kiếm
    var searchInput = document.getElementById('search-input');
    var searchButton = document.getElementById('search-button');

    // Xử lý sự kiện click vào nút tìm kiếm
    searchButton.addEventListener('click', function () {
        var searchText = searchInput.value;
        if (searchText !== '') {
            // Kiểm tra xem người dùng đã nhập vào một từ khóa hay là một tọa độ
            if (isNaN(searchText)) {
                // Tìm kiếm địa điểm dựa trên từ khóa
                searchPlaceByName(searchText);
            } else {
                // Chuyển đổi tọa độ kinh độ/vĩ độ thành đối tượng OpenLayers và di chuyển marker tới vị trí đó
                var coordinates = [parseFloat(searchText.split(',')[0]), parseFloat(searchText.split(',')[1])];
                var pos = ol.proj.fromLonLat(coordinates);
                marker.getGeometry().setCoordinates(pos);
                // Set lại center của map
                map.getView().setCenter(pos);
                map.getView().setZoom(15);
            }
        }
    });

    // Xử lý sự kiện nhấn phím Enter để gửi tin nhắn
    $('#search-input').keypress(function (e) {
        if (e.which === 13) { // Kiểm tra xem phím Enter đã được bấm chưa
            var searchText = searchInput.value;
            if (searchText !== '') {
                // Kiểm tra xem người dùng đã nhập vào một từ khóa hay là một tọa độ
                if (isNaN(searchText)) {
                    // Tìm kiếm địa điểm dựa trên từ khóa
                    searchPlaceByName(searchText);
                } else {
                    // Chuyển đổi tọa độ kinh độ/vĩ độ thành đối tượng OpenLayers và di chuyển marker tới vị trí đó
                    var coordinates = [parseFloat(searchText.split(',')[0]), parseFloat(searchText.split(',')[1])];
                    var pos = ol.proj.fromLonLat(coordinates);
                    marker.getGeometry().setCoordinates(pos);
                    // Set lại center của map
                    map.getView().setCenter(pos);
                    map.getView().setZoom(15);
                }
            }
        }
    });

    // Hàm tìm kiếm địa điểm dựa trên từ khóa
    function searchPlaceByName(searchText) {
        var url = `https://nominatim.openstreetmap.org/search?q=${searchText}&format=json`;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                if (data.length > 0) {
                    var result = data[0];
                    var pos = ol.proj.fromLonLat([parseFloat(result.lon), parseFloat(result.lat)]);
                    // Di chuyển marker tới vị trí tìm kiếm được
                    marker.getGeometry().setCoordinates(pos);

                    // Set lại center của map
                    map.getView().setCenter(pos);
                    map.getView().setZoom(18);

                    var lonlat = ol.proj.toLonLat(pos);
                    handlePosition(lonlat);
                } else {
                    alert('Không tìm thấy địa điểm');
                }
            })
    }
}

$('#MuiTen').click(function () {
    var map = document.getElementById("map");
    var mapElement = document.getElementById("body");
    mapElement.classList.remove("danhmucsp");
    map.classList.add("danhmucsp");
    var danhmucsp = document.querySelector('.danhmucsp');
    if (danhmucsp) {
        danhmucsp.scrollIntoView({ behavior: 'smooth' });
    }
});