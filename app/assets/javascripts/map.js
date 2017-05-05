function renderMap() {
  $.getJSON("/api/v1/sites.json").then(function(response) {
    $('#map').each(function() {
      var map = new google.maps.Map(this, {
        zoom: zoom,
        center: centerPoint,
        mapTypeId: google.maps.MapTypeId.TERRAIN
      });

      response.forEach(setupMarkerForSite.bind(this, map));
    })
  })
}

const centerPoint = { lat: 39.50, lng: -98.35 };
const zoom = 4;

function resetMap(map) {
  map.setZoom(zoom);
  map.setCenter(centerPoint);
};

function setupMarkerForSite(map, site) {
  var coordinates = { lng: parseFloat(site.longitude), lat: parseFloat(site.latitude) };
  var marker = new google.maps.Marker({
    position: coordinates,
    map: map,
    title: site.name,
  });

  var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">' + site.name + '</h1>'+
      '<div id="bodyContent">'+
      '<p>' + site.description + '</p>' +
      '<p>Information: <a href="http://www.gaultschool.org/Home.aspx", target="_blank">' +
      'http://www.gaultschool.org/Home.aspx' +
      '</a></p>'+
      // '<img src="http://www.texasbeyondhistory.net/gault/images/2001tamu-sm2.jpg", width="250px"' +
      '</div>' + '</div>';

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  marker.addListener('mouseover', function () {
    infowindow.open(map, marker);
  });

  marker.addListener('mouseout', function () {
    if(map.zoom === 4) {
      infowindow.close();
    }
  });

  marker.addListener('click', function() {
    map.setZoom(11);
    map.setCenter(marker.getPosition());
    infowindow.open(map, marker);
  });

  google.maps.event.addListener(infowindow,'closeclick',function(){
    resetMap(map);
  });
}
