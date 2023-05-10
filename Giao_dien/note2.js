            var searchInput = document.getElementById('search-input');
            var searchButton = document.getElementById('search-button');
            var autocomplete = new google.maps.places.Autocomplete(searchInput);

            // Lấy gợi ý từ Google Places API khi người dùng nhập từ khóa tìm kiếm
            autocomplete.addListener('place_changed', function () {
                var place = autocomplete.getPlace();
                if (place.geometry) {
                    var pos = ol.proj.fromLonLat([place.geometry.location.lng(), place.geometry.location.lat()]);
                    marker.getGeometry().setCoordinates(pos);
                    map.getView().setCenter(pos);
                    map.getView().setZoom(15);
                } else {
                    alert('Không tìm thấy địa điểm');
                }
            });

            // Lấy gợi ý từ API hoặc tệp JSON khi người dùng nhập từ khóa tìm kiếm
            $('#search-input').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "https://api.example.com/search",
                        dataType: "json",
                        data: {
                            q: request.term
                        },
                        success: function (data) {
                            response($.map(data, function (item) {
                                return {
                                    label: item.name,
                                    value: item.coordinates
                                };
                            }));
                        }
                    });
                },
                select: function (event, ui) {
                    var pos = ol.proj.fromLonLat(ui.item.value);
                    marker.getGeometry().setCoordinates(pos);
                    map.getView().setCenter(pos);
                    map.getView().setZoom(15);
                    return false;
                }
            });

            searchButton.addEventListener('click', function () {
                var searchText = searchInput.value;
                if (searchText !== '') {
                    if (isNaN(searchText)) {
                        searchPlaceByName(searchText);
                    } else {
                        var coordinates = [parseFloat(searchText.split(',')[0]), parseFloat(searchText.split(',')[1])];
                        var pos = ol.proj.fromLonLat(coordinates);
                        marker.getGeometry().setCoordinates(pos);
                        map.getView().setCenter(pos);
                        map.getView().setZoom(15);
                    }
                }
            });

            $('#search-input').keypress(function (e) {
                if (e.which === 13) {
                    var searchText = searchInput.value;
                    if (searchText !== '') {
                        if (isNaN(searchText)) {
                            searchPlaceByName(searchText);
                        } else {
                            var coordinates = [parseFloat(searchText.split(',')[0]), parseFloat(searchText.split(',')[1])];
                            var pos = ol.proj.fromLonLat(coordinates);
                            marker.getGeometry().setCoordinates(pos);
                            map.getView().setCenter(pos);
                            map.getView().setZoom(15);
                        }
                    }
                }
            });

            function searchPlaceByName(searchText) {
                var url = `https://nominatim.openstreetmap.org/search?q=${searchText}&format=json`;
                fetch(url)
                    .then(response => response.json())
                    .then(data => {
                        if (data.length > 0) {
                            var result = _.find(hotels, { name: searchText });
                            if (result) {
                                var pos = ol.proj.fromLonLat(result.coordinates);
                                map.getView().setCenter(pos);
                                map.getView().setZoom(18);
                            } else {
                                var resultt = data[0];
                                var pos = ol.proj.fromLonLat([parseFloat(resultt.lon), parseFloat(resultt.lat)]);
                                marker.getGeometry().setCoordinates(pos);
                                map.getView().setCenter(pos);
                                map.getView().setZoom(18);
                            }
                        } else {
                            alert('Không tìm thấy địa điểm');
                        }
                    })
            }

            // Thêm tính năng gợi ý khi nhập từ khóa tìm kiếm
            var suggestInput = document.getElementById('suggest-input');
            var suggestList = document.getElementById('suggest-list');

            suggestInput.addEventListener('input', function () {
                var suggestText = suggestInput.value;
                var suggestUrl = `https://nominatim.openstreetmap.org/search?q=${suggestText}&format=jsonv2&limit=5`;
                    // Fetch từ khóa gợi ý
                    fetch(suggestUrl)
                        .then(response => response.json())
                        .then(data => {
                            // Xóa danh sách gợi ý hiện tại
                            while (suggestList.firstChild) {
                                suggestList.removeChild(suggestList.firstChild);
                            }

                            // Tạo danh sách gợi ý mới
                            for (var i = 0; i < data.length; i++) {
                                var suggestItem = document.createElement('li');
                                suggestItem.textContent = data[i].display_name;
                                suggestItem.setAttribute('data-coordinates', data[i].lon + ',' + data[i].lat);

                                // Thêm sự kiện click vào mỗi item
                                suggestItem.addEventListener('click', function () {
                                    var coordinates = this.getAttribute('data-coordinates').split(',');
                                    var pos = ol.proj.fromLonLat(coordinates);
                                    marker.getGeometry().setCoordinates(pos);
                                    map.getView().setCenter(pos);
                                    map.getView().setZoom(18);
                                    suggestList.style.display = 'none';
                                });

                                suggestList.appendChild(suggestItem);
                            }

                            // Hiển thị danh sách gợi ý
                            suggestList.style.display = 'block';
                        })
                    .catch(error => console.log(error));
            });

            // Ẩn danh sách gợi ý khi click bên ngoài ô input
            document.addEventListener('click', function (event) {
                if (!suggestInput.contains(event.target)) {
                    suggestList.style.display = 'none';
                }
            });
