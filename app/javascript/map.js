let map
let geocoder

function initMap(){
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.703541, lng: 139.851527},
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








// let map
// let geocoder
// // var customer_address

// function initMap(){
//   // geocoderを初期化
//   geocoder = new google.maps.Geocoder()

//   let customer_address = document.getElementById("customer_address").value;
//     // ジオコーディングを依頼する
//     geocoder.geocode(
//         {'customer_address': address}, // ジオコーディング リクエスト
//         function(results, status) { // ジオコーディング結果callback関数
//             if (status == gs.OK) { // 結果がOK ??
//                 // マップ中心設定
//                 map.setCenter(results[0].geometry.location);
//             } else {
//                 // 結果がOKではない場合
//                 alert("ジオコーディングが失敗しました。理由: " + geocoderErr[status]);
//             }
//         });
//   // 初期化の所で一回customerの住所から割り出す記述して、、、、centerにするか？一回ジオコーディングで文字列から住所割り出したのを配置する必要あるよね
  
//   map = new google.maps.Map(document.getElementById('map'), {
//   center: customer_address,
//   zoom: 15
//   });

// }

// window.onload = function () {
//   initMap();
// };