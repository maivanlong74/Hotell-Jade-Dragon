// Tạo lớp vẽ để lưu trữ vị trí được chọn
var vectorSource = new ol.source.Vector();

// Tạo lớp vẽ để hiển thị các vị trí được chọn
var vectorLayer = new ol.layer.Vector({
  source: vectorSource,
  style: new ol.style.Style({
    image: new ol.style.Circle({
      radius: 5,
      fill: new ol.style.Fill({color: 'red'})
    })
  })
});

// Thêm lớp vẽ vào bản đồ
map.addLayer(vectorLayer);

// Lắng nghe sự kiện click trên bản đồ
map.on('click', function(evt) {
  // Lấy thông tin vị trí được chọn
  var coord = evt.coordinate;
  var lonLat = ol.proj.transform(coord, 'EPSG:3857', 'EPSG:4326');

  // Thêm vị trí vào lớp vẽ
  var feature = new ol.Feature(new ol.geom.Point(coord));
  vectorSource.clear();
  vectorSource.addFeature(feature);

  // Hiển thị thông tin vị trí được chọn
  alert('Latitude: ' + lonLat[1] + ', Longitude: ' + lonLat[0]);
});
