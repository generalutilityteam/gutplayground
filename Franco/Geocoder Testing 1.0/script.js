//Global Variables
var map;
var geocoder;
var marker;

//utility methods
function log(obj){
	console.log(obj);
}

function initialize(){ // Function that runs at the start of the page
	
	//Initialize Map
	var latlng = new google.maps.LatLng(14.5800, 121.000);
    var mapOptions = {
        zoom: 15,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById('map-div'), mapOptions);
    google.maps.event.addListener(map, 'click', function (event) {
		geocodeMouseClick(event.latLng);
    });
	
	//Initialzie Geocoder
	geocoder = new google.maps.Geocoder();
}
function searchArea(){ //This is the searchbar search
	var str = document.getElementById('address').value;
	geocodeString(str);
}
function printAddressComponents(arr){ // This method just prints a formatted address aray
	var textArea = document.getElementById("outarea");
	textArea.innerHTML = "";
	//Object Out
	var obj = convertArrToObject(arr);
	textArea.innerHTML += generateFullAddress(obj) + "\n\n";
	//Array Out
	arr.forEach(function(area){
		textArea.innerHTML += area.type + "----" + area.name + "\n";
	});

}
function convertArrToObject(arr){
	var obj = new Object();
	arr.forEach(function(comp){
		switch(comp.type){
			case 'sublocality':
				obj.sublocality = comp.name;
				break;
			case 'locality':
				obj.locality = comp.name;
				break;
			case 'administrative_area_level_2':
				obj.administrative_area_level_2 = comp.name;
				break;
			case 'administrative_area_level_1':
				obj.administrative_area_level_1 = comp.name;
				break;
			case 'country':
				obj.country = comp.name;
				break;
		}
	});
	return obj;
}

//GEOCODER FUNCTIONS
function geocodeSuccess(arr){//This is unique per page
	printAddressComponents(arr);
	console.log(convertArrToObject(arr));
}

function geocodeString(str){ // Runs a search based on the contents of #address
    geocoder.geocode({
		'address': str
	}, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.panTo(results[0].geometry.location);
			map.fitBounds(results[0].geometry.viewport);
			console.log(results[0].geometry);
			var formattedArr = formatAddressComponents(results[0].address_components);
            geocodeSuccess(formattedArr);
        } else {
            //I doubt this will ever happen, though
        }
    });
}
function geocodeMouseClick(pos){ // Runs a search based on a mouse click event
	geocoder.geocode({
        latLng: pos
    }, function (results) {
        if (results && results.length > 0) {
            var formattedArr = formatAddressComponents(results[0].address_components);
            geocodeSuccess(formattedArr);
        } else {
            //I doubt this will ever happen, though
        }
    });
}
function formatAddressComponents(arr){ //This method takes in the address_components of either a Marker or Searchbar and shortens it into a usable array
	var returnArr = new Array();
	arr.forEach(function(comp){
		comp.types.forEach(function (type){
			//if(type == 'sublocality' || type == 'locality' || type == 'administrative_area_level_2' || type == 'administrative_area_level_1' || type == 'country'){
			if(type != 'political'){
				var area = {
					name:comp.long_name,
					type:type 
				};
				returnArr.push(area);
			}
		});
	});
	return returnArr;
}
function generateFullAddress(obj){ // Converts Address components of an object into a String that contains them 
    var sublocal = (obj.sublocality != null ? obj.sublocality + ", " : "");
    var locality = (obj.locality != null ? obj.locality + ", " : "");
    var admin2 = (obj.administrative_area_level_2 != null ? obj.administrative_area_level_2 + ", " : "");
    var admin1 = (obj.administrative_area_level_1 != null ? obj.administrative_area_level_1 + ", " : "");
    var country = obj.country;
	
	return sublocal + locality + admin2 + admin1 + country;
}