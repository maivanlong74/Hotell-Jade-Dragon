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
    view: new ol.View({
      center: ol.proj.fromLonLat([107.583801, 16.463713]), // Tọa độ trung tâm (kinh độ, vĩ độ)
      zoom: 12, // Độ zoom ban đầu
    }),
  });

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
  geolocation.on('change:position', function () {
    var coordinates = geolocation.getPosition();
    positionFeature.setGeometry(coordinates ? new ol.geom.Point(coordinates) : null);
  });
  var vectorSource = new ol.source.Vector({
    features: [positionFeature]
  });
  var vectorLayer = new ol.layer.Vector({
    source: vectorSource
  });
  map.addLayer(vectorLayer);

  // Xử lý thông tin địa điểm khi click vào bản đồ
    map.on('singleclick', function (evt) {
    var lonlat = ol.proj.toLonLat(evt.coordinate);
    handlePosition(lonlat, evt);
  });
  
  
  function handlePosition(lonlat, evt) {
    // Tìm kiếm địa điểm gần vị trí chọn nhất và hiển thị thông tin lên bản đồ
    var url = `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lonlat[1]}&lon=${lonlat[0]}`;
    fetch(url)
        .then(response => response.json())
        .then(data => {
        console.log(data);
        var result = document.getElementById("result");
        if (result) {
            result.innerHTML = `<p>Địa điểm bạn đã chọn:</p><p>${data.display_name}</p>`;
        } else {
            console.log("Element with ID 'result' not found");
        }
        })
        .catch(error => {
        console.error("Error fetching data:", error);
        });

          // Tạo phần tử hiển thị dấu chấm
        var dot = $("<div>").addClass("dot");
        var overlay = new ol.Overlay({
            element: dot.get(0),
            position: lonlat,
            positioning: "center-center",
            stopEvent: false
        });
        map.addOverlay(overlay);
        // Lưu trữ overlay trong biến global để loại bỏ sau này
        dotOverlays.push(overlay);

        // Thêm class "dot" vào phần tử hiển thị dấu chấm
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
        dot.addClass("dot");
  }

    // Thêm control zoom slider
    var zoomSlider = new ol.control.ZoomSlider();
    map.addControl(zoomSlider);

    // Thêm control zoom to extent
    var zoomToExtent = new ol.control.ZoomToExtent({
    extent: [
        13151378.48040912,
        2265625.3180069763,
        14514668.48040912,
        3348835.3180069763
    ]
    });
    map.addControl(zoomToExtent);

    // Thêm control full screen
    var fullScreen = new ol.control.FullScreen();
    map.addControl(fullScreen);

    
  
}