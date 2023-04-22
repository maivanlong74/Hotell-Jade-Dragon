var map; // Khai báo biến map ở đầu file js.js

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
                url: '/api/location',
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
            map.getView().setZoom(15);
        });
    } else {
        alert('Định vị địa lý không được trình duyệt của bạn hỗ trợ');
    }
    // ------------------------------

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

    //----------------------------------------




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
        var url = `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lonlat[1]}&lon=${lonlat[0]}`;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log(data);
                var result = document.getElementById("result");
                if (result) {
                    result.innerHTML = `<i>${data.display_name}</i>
                    <input type="hidden" placeholder="" value="${data.display_name}" name="">`;
                } else {
                    console.log("Không tìm thấy phần tử có ID 'kết quả'");
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

}