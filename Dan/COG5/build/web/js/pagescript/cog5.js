var network, nodes, edges;

var options = {
    manipulation: {
        addNode: function (data, callback) {
            // filling in the popup DOM elements
            document.getElementById('operation').innerHTML = "Add Node";
            document.getElementById('node-id').value = data.id;
            document.getElementById('node-label').value = data.label;
            document.getElementById('node-group').value = data.group;
            document.getElementById('saveButton').onclick = saveData.bind(this, data, callback);
            document.getElementById('cancelButton').onclick = clearPopUp.bind();
            document.getElementById('network-popUp').style.display = 'block';
        },
        editNode: function (data, callback) {
            // filling in the popup DOM elements
            document.getElementById('operation').innerHTML = "Edit Node";
            document.getElementById('node-id').value = data.id;
            document.getElementById('node-label').value = data.label;
            document.getElementById('node-group').value = data.group;
            document.getElementById('saveButton').onclick = saveData.bind(this, data, callback);
            document.getElementById('cancelButton').onclick = cancelEdit.bind(this, callback);
            document.getElementById('network-popUp').style.display = 'block';
        },
        addEdge: function (data, callback) {
            var x = nodes.get(data.from);
            var y = nodes.get(data.to);
            if (data.from == data.to) {
                alert("You cannot connect the node to itself.");
            }
            if (
                    (x.group == "cog" && y.group == "cr") ||
                    (x.group == "cr" && y.group == "cog") ||
                    (x.group == "cog" && y.group == "cv") ||
                    (x.group == "cv" && y.group == "cog") ||
                    (x.group == "cc" && y.group == "cv") ||
                    (x.group == "cv" && y.group == "cc")
                    ) {
                alert("You cannot connect " + x.group.toUpperCase() + " to " + y.group.toUpperCase());
            }

            else {
                callback(data);
            }
        }
    },
    nodes: {
        shape: 'dot',
        size: 15,
        color: 'black',
        font: {
            size: 15,
            color: 'black'
        },
        borderWidth: 2
    },
    edges: {
        width: 2,
        color: '#202020'
    },
    groups: {
        cog: {
            shape: 'icon',
            icon: {
                face: 'FontAwesome',
                code: '\uf21e',
                size: 50,
                color: '#CC0000'
            }
        },
        cc: {
            shape: 'icon',
            icon: {
                face: 'FontAwesome',
                code: '\uf1e2',
                size: 30,
                color: '#202020'
            }
        },
        cr: {
            shape: 'icon',
            icon: {
                face: 'FontAwesome',
                code: '\uf06a',
                size: 30,
                color: '#FF4500'
            }
        },
        cv: {
            shape: 'icon',
            icon: {
                face: 'FontAwesome',
                code: '\uf13e',
                size: 30,
                color: '#DAA520'
            }
        }
    }
};
var nodesArray, edgesArray;
nodes = new vis.DataSet();
edges = new vis.DataSet();


//Custom functions
function draw() {
    // create a network   
    var container = document.getElementById('mynetwork');

    if (nodesArray != null) {
        for (var x = 0; x < nodesArray.length; x++) {
            nodes.add(nodesArray[x]);
        }
    }
    if (edgesArray != null) {
        for (var x = 0; x < edgesArray.length; x++) {
            edges.add(edgesArray[x]);
        }
    }

    var data = {
        nodes: nodes,
        edges: edges
    };

    network = new vis.Network(container, data, options);

}
function clearAll() {
    if (network !== null) {
        network.destroy();
        network = null;
    }
    nodes = [];
    edges = [];
    draw();
}
function resetAll() {
    if (network !== null) {
        network.destroy();
        network = null;
    }
    nodes = nodesArray;
    edges = edgesArray;
    draw();
}
function addNode() {
    var newId = (Math.random() * 1e7).toString(32);
    nodes.add({id: newId, label: "new", group: "cog"});
}

//Standard functions
function clearPopUp() {
    document.getElementById('saveButton').onclick = null;
    document.getElementById('cancelButton').onclick = null;
    document.getElementById('network-popUp').style.display = 'none';
}

function cancelEdit(callback) {
    clearPopUp();
    callback(null);
}

function saveData(data, callback) {
    data.id = document.getElementById('node-id').value;
    data.label = document.getElementById('node-label').value;
    data.group = document.getElementById('node-group').value;
    clearPopUp();
    callback(data);
    nodes.update([{id: data.id, label: data.label, group: data.group}]);
}

function saveCOG() {
    var saveNodes = nodes.get({
        fields: ['id', 'label', 'group'],
        type: {
            group: 'String'                 // convert the group fields to Strings
        }
    });
    var saveEdges = edges.get();
    var nodesJSON = JSON.stringify(saveNodes);
    var edgesJSON = JSON.stringify(saveEdges);

    //get CR and CVs connected to it
    var cr = nodes.get({
        filter: function (items) {
            return (items.group == "cr");
        }
    })
    
    for(var x=0; x<cr.length; x++){
        var crConnected = network.getConnectedNodes(cr[x].id);
        var cvConnectedToCr = [];
        alert(cr[x].id);
        for(var y=0; y<crConnected.length; y++){
            alert(crConnected[y]);
            if(nodes.get(crConnected[y]).group === "cv"){
                cvConnectedToCr.push(nodes.get(crConnected[y]));
            }
        }
        for(var z=0; z<cvConnectedToCr.length; z++){
            alert(cvConnectedToCr[z].label);
        }
    }

    window.location.assign("LoadNextPage?nodes=" + nodesJSON + "&edges=" + edgesJSON);
}
