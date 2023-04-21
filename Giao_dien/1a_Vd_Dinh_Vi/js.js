if ('geolocation' in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = ol.proj.fromLonLat([position.coords.longitude, position.coords.latitude]);
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
      map.getView().setZoom(12);
    });
  } else {
    alert('Geolocation is not supported by your browser');
  }
  