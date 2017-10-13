// Entry point for the application.
define([
    "dijit/layout/BorderContainer",
    "./LoginDialog",
    "./MenuBar",
    "./Dashboard",
    "dojo/domReady!"
], function(BorderContainer, LoginDialog, MenuBar, Dashboard) {

    // Callback after login which loads the dashboard using the TM1 Web 
    // session token from the login step.
    function loadDashboard(sessionToken) {
        // Create a container for the menu bar and dashboard and place it
        // on the document body.
        var borderContainer = new BorderContainer({
            style: {
                width: "100%",
                height: "100%",
                overflow: 'auto'
            }
        }).placeAt(document.body);
        
        var dashboard = new Dashboard({
            region: "center",
            style: "height: 100%; width: 100%",
            sessionToken: sessionToken
        });
        
        var menuBar = new MenuBar({
            region: "top",
            dashboard: dashboard,
            sessionToken: sessionToken
        });
        
        borderContainer.addChild(menuBar);
        borderContainer.addChild(dashboard);
    };

    // Create a login dialog that loads the dashboard once login completes.
    var loginDialog = new LoginDialog({
        onLogin: loadDashboard,
        onHide: function() {
            loginDialog.destroyRecursive();
            loginDialog = null;
        }
    });

    loginDialog.show();
});
