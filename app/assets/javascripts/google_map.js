function initialize() {
  var myLatLng = new google.maps.LatLng(40.388303, 17.634001);
  var mapOptions = {
    center: myLatLng,
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
  var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: "Stano s.a.s."
  });
}
google.maps.event.addDomListener(window, 'load', initialize);
