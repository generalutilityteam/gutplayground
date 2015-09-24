document.write(
        '\
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">\
            <div class="navbar-header">\
                <a class="navbar-brand active" href="Home">\
                        <span><img src="images/SHIELD LOGO.PNG" height="25px" width="22px"></span> SHIELD</a>\
            </div>\
            <div>\
                <ul class="nav navbar-nav" id="left-nav">\
                    <li><a href="ExistingMissions"><span class="glyphicon glyphicon-flag"></span> MISSIONS</a></li>\
                    <li><a href="ViewLocations"><span class="glyphicon glyphicon-folder-open"></span> DATA SOURCES</a></li>\
                </ul>\
                <!--Right Nav Bar-->\
                <ul class="nav navbar-nav navbar-right" id="right-nav">\
                    <li class="dropdown">\
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">\
                            <span class="glyphicon glyphicon-user"></span> <label id="userlabel"></label>\
                        </a>\
                        <ul class="dropdown-menu">\
                            <li><a href="#">Account Information</a></li>\
                            <li><a href="Logout">Logout</a></li>\
                        </ul>\
                    </li>\
                </ul>\
            </div>\
        </nav><br><br><br>\
        '
        );