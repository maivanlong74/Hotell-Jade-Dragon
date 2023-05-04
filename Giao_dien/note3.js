Đây là code js:
var map;
function initMap(locations) {
    map = new ol.Map({
        target: 'map',
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            })
        ],
    });
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
    // Tạo một lớp vector để chứa marker
    var vectorLayer = new ol.layer.Vector({
        source: new ol.source.Vector({
            features: [marker]
        })
    });
    // Thêm lớp vector vào bản đồ
    map.addLayer(vectorLayer);
    // Tạo các lớp vector và thêm chúng vào bản đồ
    locations.forEach(function (lonlat) {
        var vectorLayer = Search_KD_VD(lonlat);
        map.addLayer(vectorLayer);
    });
    function Search_KD_VD(lonlat) {
        // Lấy kinh độ và vĩ độ từ mảng lonlat
        var [lon, lat] = lonlat;

        // Tạo một đối tượng marker với vị trí tương ứng
        var marker = new ol.Feature({
            geometry: new ol.geom.Point(ol.proj.fromLonLat([lon, lat]))
        });
        // Thiết lập biểu tượng cho marker
        marker.setStyle(new ol.style.Style({
            image: new ol.style.Icon({
                anchor: [0.5, 1],
                src: 'https://openlayers.org/en/latest/examples/data/icon.png'
            })
        }));
        // Tạo một lớp vector để chứa marker
        var vectorLayer = new ol.layer.Vector({
            source: new ol.source.Vector({
                features: [marker]
            })
        });
        return vectorLayer;
    }
}

  Bây giờ tôi muốn khi hover chuột vào mỗi icon khách sạn hiển thị trên map thì thông tin khách sạn sẽ hiện ra