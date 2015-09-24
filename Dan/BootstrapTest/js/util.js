// For: SHIELD
// V 0.2 , Updated as of 3/7//15

function toTitleCase(str) //Turns string into Title case (e.g. one two three - > One Two Three)
{
    return str.replace(/\w\S*/g, function (txt) {
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    });
}
function clearTable(tableName) //clears the rows of a table
{
    table = document.getElementById(tableName);
    var rowCount = table.rows.length;
    for (var x = 1; x < rowCount; x++) {
        table.deleteRow(1);
    }
}
function numbersonly(myfield, e, dec) //use in conjunction with input attribute "onKeyPress='return numbersonly(this,event)" to restrict a user to numbers
{
    var key;
    var keychar;

    if (window.event)
        key = window.event.keyCode;
    else if (e)
        key = e.which;
    else
        return true;
    keychar = String.fromCharCode(key);

// control keys
    if ((key == null) || (key == 0) || (key == 8) ||
            (key == 9) || (key == 13) || (key == 27))
        return true;

// numbers
    else if ((("0123456789").indexOf(keychar) > -1))
        return true;

// decimal point jump
    else if (dec && (keychar == "."))
    {
        myfield.form.elements[dec].focus();
        return false;
    }
    else
        return false;
}
function numbersonlycontact(myfield, e, dec) // allows the hyphen (-)
{
    var key;
    var keychar;

    if (window.event)
        key = window.event.keyCode;
    else if (e)
        key = e.which;
    else
        return true;
    keychar = String.fromCharCode(key);

// control keys
    if ((key == null) || (key == 0) || (key == 8) ||
            (key == 9) || (key == 13) || (key == 27) || (key == 45))
        return true;

// numbers
    else if ((("0123456789").indexOf(keychar) > -1))
        return true;

// decimal point jump
    else if (dec && (keychar == "."))
    {
        myfield.form.elements[dec].focus();
        return false;
    }
    else
        return false;
}
function numbersonlydouble(myfield, e, dec) // allows the period (.)
{
    var key;
    var keychar;

    if (window.event)
        key = window.event.keyCode;
    else if (e)
        key = e.which;
    else
        return true;
    keychar = String.fromCharCode(key);

// control keys
    if ((key == null) || (key == 0) || (key == 8) ||
            (key == 9) || (key == 13) || (key == 27) ||
            (key == 46))
        return true;

// numbers
    else if ((("0123456789").indexOf(keychar) > -1))
        return true;

// decimal point jump
    else if (dec && (keychar == "."))
    {
        myfield.form.elements[dec].focus();
        return false;
    }
    else
        return false;
}
function checkIfEmpty(str) //checks if the str is empty
{
    if (str == null || str === 'undefined')
        return null;

    var clearStr = str.replace(/\s/g, '');
    if (clearStr == "")
        return null;
    else
        return str;
}
function toJSON(obj)  //converts and object into a JSON string
{
    return JSON.stringify(obj, null, 4);
}
function breakString(str, breakAt)  //breaks a string at point 'breakAt' and inserts a \n
{
    var strArray = str.split(" ");
    var result = "";
    var temp = "";
    if (str.length < breakAt)
        return str;
    for (var x = 0; x < strArray.length; x++) {

        temp += strArray[x] + " ";
        if (temp.length > breakAt) {
            if(strArray[x+1] != strArray.length)
                temp += '\n';
            result += temp;
            temp = "";
        }
    }
    return result;
}