var nodesJSON = "";
var edgesJSON = "";
function initialize() {

    document.getElementById('nodesContent').value = nodesArray;
    document.getElementById('edgesContent').value = edgesArray;
    
}

function saveChanges() {
    nodesJSON = document.getElementById('nodesContent').value;
    edgesJSON = document.getElementById('edgesContent').value;

    window.location.assign("LoadCOG?nodes=" + nodesJSON + "&edges=" + edgesJSON);

}
