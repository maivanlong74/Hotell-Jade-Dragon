
    var searchBtn = document.getElementById("search-btn");
    searchBtn.addEventListener("click", searchAddress);

    function searchAddress() {
      var address = document.getElementById("search").value;
      var url = "https://nominatim.openstreetmap.org/search?q=" + address + "&format=json";
      fetch(url)
        .then(function (response) {
          return response.json();
        })
        .then(function (data) {
          // Hiển thị kết quả tìm kiếm trên bản đồ
          showSearchResults(data);
        })
        .catch(function (error) {
          console.log(error);
        });
    }
    
    function showSearchResults(data) {
      // Xóa tất cả các marker trên bản đồ
      markerLayer.getSource().clear();
    
      // Hiển thị kết quả tìm kiếm trên bản đồ
      if (data.length > 0) {
        var searchResult = data[0];
        var searchResultCoord = ol.proj.fromLonLat([searchResult.lon, searchResult.lat]);
        var searchResultMarker = new ol.Feature({
          geometry: new ol.geom.Point(searchResultCoord),
        });
        searchResultMarker.setStyle(
          new ol.style.Style({
            image: new ol.style.Icon({
              src: "https://openlayers.org/en/latest/examples/data/icon.png",
            }),
          })
        );
        markerLayer.getSource().addFeature(searchResultMarker);
        map.getView().setCenter(searchResultCoord);
        map.getView().setZoom(15);
      }
    }

    // Tạo một control tìm kiếm địa điểm trên bản đồ
var searchControl = new L.Control.Search({
    position: 'topleft',
    layer: markerLayer,
    propertyName: 'name',
    initial: false,
    zoom: 15,
    marker: false,
    textPlaceholder: 'Tìm kiếm địa điểm...',
    moveToLocation: function (latlng, title, map) {
      // Di chuyển marker tới vị trí được chọn
      marker.getGeometry().setCoordinates(latlng);
      // Hiển thị thông tin địa điểm lên bản đồ
      var popup = new ol.Overlay.Popup();
      map.addOverlay(popup);
      popup.show(latlng, '<div>' + title + '</div>');
    }
  });
  map.addControl(searchControl);
  
  // Xử lý sự kiện khi tìm kiếm địa điểm
  searchControl.on('search:locationfound', function (e) {
    // Lấy thông tin về địa điểm được chọn
    var result = e.text.split(',');
    var name = result[0];
    var lat = e.latlng.lat;
    var lon = e.latlng.lng;
    var pos = ol.proj.fromLonLat([lon, lat]);
  
    // Di chuyển marker tới vị trí được chọn
    marker.getGeometry().setCoordinates(pos);
  
    // Hiển thị thông tin địa điểm lên bản đồ
    var popup = new ol.Overlay.Popup();
    map.addOverlay(popup);
    popup.show(pos, '<div>' + name + '</div>');
  });
  
  // Xử lý sự kiện
  def search():
  # Lấy từ khóa tìm kiếm
  keyword = search_box.get()

  # Tìm kiếm trong danh sách sản phẩm
  results = []
  for product in products:
      if keyword.lower() in product['name'].lower():
          results.append(product)

  # Hiển thị kết quả
  show_products(results)  