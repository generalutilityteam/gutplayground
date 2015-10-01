//Global Variables
var map;
var geocoder;
var marker;

function initialize(){
	
	//Initialize Map
	var latlng = new google.maps.LatLng(14.5800, 121.000);
    var mapOptions = {
        zoom: 15,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById('map-div'), mapOptions);
    google.maps.event.addListener(map, 'click', function (event) {
		printAddressComponents(event.latLng);
    });
	
	//Initialzie Geocoder
	geocoder = new google.maps.Geocoder();
}

function geocode(){
	var address = document.getElementById('address').value;
	alert(address);
    geocoder.geocode({'address': address}, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            printAddressComponents(results[0].geometry.location);
        } else {
            alert("Google Map failed </strong>to locate the area.");
        }
    });
}
function printAddressComponents(pos){
	geocoder.geocode({
		latLng: pos
	}, function (responses) {
		if (responses && responses.length > 0) {
			var componentArr = responses[0].address_components;
			var textArea = document.getElementById("outarea");
			textArea.innerHTML = "";
			componentArr.forEach(function(comp){
				textArea.innerHTML += comp.types.join() + ": " + comp.long_name + "/" + comp.short_name + "\n";
			});
        } else {
            alert('Cannot determine address at this location.');
        }
	});
}
function reverseGeocode(pos){
	
	geocoder.geocode({
        latLng: pos
    }, function (responses) {
        if (responses && responses.length > 0) {
            marker.formatted_address = responses[0].formatted_address;
        } else {
            marker.formatted_address = 'Cannot determine address at this location.';
        }
        infowindow.setContent(marker.formatted_address + "<br>Coordinates: " + marker.getPosition().toUrlValue(6));
        infowindow.open(map, marker);
    });
}
function dataOut(str){
	document.getElementById("outarea").innerHTML = str; 
}