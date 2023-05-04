var map = new ol.Map({
    target: 'map',
    layers: [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      })
    ],
    view: new ol.View({
      center: ol.proj.fromLonLat([106.6886, 10.8231]),
      zoom: 6
    })
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
  
  // Tạo các tọa độ cần tìm kiếm
  var locations = [  [105.8522, 21.0278],
    [106.6856, 10.8231],
    [107.6032, 16.4580],
    // Thêm các tọa độ khác nếu cần
  ];
  
  // Tạo các lớp vector và thêm chúng vào bản đồ
  locations.forEach(function(lonlat) {
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
  