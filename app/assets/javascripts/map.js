function initMap() {
var gaultSite = {lat: 30.89225, lng: -97.70975};

var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 4,
  center: gaultSite,
  mapTypeId: google.maps.MapTypeId.TERRAIN
});

var contentString = '<div id="content">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">Gault Site</h1>'+
    '<div id="bodyContent">'+
    '<p><b>The Gault Site</b> is located near San Marcos is a large ' +
    'excavation site for paleaolithic research. </p>'+
    '<p>Information at Gault School, <a href="http://www.gaultschool.org/Home.aspx", target="_blank">'+
      'http://www.gaultschool.org</a></p>'+
      '<img src="http://www.texasbeyondhistory.net/gault/images/2001tamu-sm2.jpg", width="250px"' +
    '</div>'+
    '</div>';

var infowindow = new google.maps.InfoWindow({
  content: contentString
});

var response = [
   {name: "poptarts",
    lng: -97.70975,
    lat: 30.89225
  },
    { name: "toasterStrudel",
      lng: -98.35,
      lat: 39.50
    }
]
var setMarkers = function(siteResponse) {
  siteResponse.forEach(function(site) {

    var coordinates = { lng: site.lng, lat: site.lat }
    var marker = new google.maps.Marker({
      position: coordinates,
      map: map,
      title: site.name,
    });

    var contentString = '<div id="content">'+
        '<div id="siteNotice">'+
        '</div>'+
        '<h1 id="firstHeading" class="firstHeading">' + site.name +'</h1>'+
        '<div id="bodyContent">'+
        '<p><b>The Gault Site</b> is located near San Marcos is a large ' +
        'excavation site for paleaolithic research. </p>'+
        '<p>Information at Gault School, <a href="http://www.gaultschool.org/Home.aspx", target="_blank">'+
          'http://www.gaultschool.org</a></p>'+
          '<img src="http://www.texasbeyondhistory.net/gault/images/2001tamu-sm2.jpg", width="250px"' +
        '</div>'+
        '</div>';

    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    marker.addListener('click', function() {
      map.setZoom(12);
      map.setCenter(marker.getPosition());
      infowindow.open(map, marker);
    });
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
  })

  }
  setMarkers(response);
}
// var marker = new google.maps.Marker({
//   position: gaultSite,
//   map: map,
//   title: 'Gault Site'
// });
// map.addListener('center_changed', function() {
//   // 3 seconds after the center of the map has changed, pan back to the
//   // marker.
//   window.setTimeout(function() {
//     map.panTo(marker.getPosition());
//   }, 3000);
// });
