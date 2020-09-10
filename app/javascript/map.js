let map
let geocoder

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.716284, lng: 139.840709},
  zoom: 16
  });
}

window.codeAddress = function codeAddress(){
  // 入力を取得
  let inputAddress = document.getElementById('address').value;

  // geocodingしたあとmapを移動
  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
// 　　　　　　　　　　　　// map.setCenterで地図が移動
      map.setCenter(results[0].geometry.location);

// 　　　　　　　　　　　　// google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

window.onload = function () {
  initMap();
};