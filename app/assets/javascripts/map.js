$(document).ready(function() {
    renderMap();
});

function renderMap() {
  $.ajax({
    method: "GET",
    url: "/api/v1/sites.json",
    dataType: "JSON",
    success: function(response) {
      initMap(response);
    }
  });
}

var initMap = function(response) {
  var centerPoint = {lat: 39.50, lng: -98.35};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: centerPoint,
    mapTypeId: google.maps.MapTypeId.TERRAIN
  });

  var setMarkers = function(response) {
    if (typeof response !== "undefined") {
      response.forEach(function(site) {
        var coordinates = { lng: parseFloat(site.longitude), lat: parseFloat(site.latitude) }
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
            // '<p><b>The' + site.name + '</b>: ' + site.name + '</p>'+
            '<p>Information: <a href="http://www.gaultschool.org/Home.aspx", target="_blank">' +
            'http://www.gaultschool.org/Home.aspx' +
            '</a></p>'+
            // '<img src="http://www.texasbeyondhistory.net/gault/images/2001tamu-sm2.jpg", width="250px"' +
            '</div>' + '</div>';

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });
        marker.addListener('click', function() {
          map.setZoom(10);
          map.setCenter(marker.getPosition());
          infowindow.open(map, marker);
        });


      });
    }
  }
  setMarkers(response);
}

 // google.maps.event.addListener(mapMarker, "closeclick", function()
 //    {
 //        mapRef.panTo(mapSettings.center);
 //        mapRef.setZoom(2);
 //    });
