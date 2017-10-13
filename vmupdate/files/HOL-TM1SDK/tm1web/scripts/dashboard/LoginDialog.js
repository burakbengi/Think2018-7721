/**
 * A login dialog based off of the TM1 Web JavaScript Library login dialog.
 */
define([
    "dojo/_base/declare",
    "dojo/_base/lang",
    "dojo/_base/xhr",
    "dojo/dom-class",
    "tm1web/api/session/LoginDialog",
    "dijit/form/TextBox",
    "dijit/form/RadioButton",
    "dijit/form/CheckBox",
    "dijit/form/Select"
], function(declare, lang, xhr, domClass, LoginDialogBase) {

    var LoginDialog = declare(LoginDialogBase, {

        // We don't want the admin host or TM1 server to be visible,
        // so we disable that here.
        adminHostVisible: false,
        tm1ServersVisible: false,

        // Use CarSales as the TM1 server to authenticate against.
        tm1Server: "CarSales",

        /**
         * Shows the login dialog and sets the page's background.
         */
        show: function() {
            this.inherited(arguments);

            domClass.add(document.body, "loginBackground");
        },

        /**
         * Hides the login dialog and removes the page's background.
         */
        hide: function() {
            this.inherited(arguments);

            domClass.remove(document.body, "loginBackground");
        },

        /**
         * Attempts to login to TM1 Web.
         */
        login: function() {
            // If the specified information is not valid or the login button
            // is disabled, abort the login process.
            if(!this._isValid() || this._loginButton.get("disabled")) {
                return;
            }

            this.set("loginDisabled", true);

            // REST request to log in to TM1 Web and execute the _onLogin
            // method when login completes.
            xhr.post({
                url: "http://localhost:9510/tm1web/api/TM1Service/login",
                handleAs: "json",
                content: {
                    param0: this.get("adminHost"), // param0 is admin host
                    param1: this.get("tm1Server"), // param1 is TM1 server
                    param2: this.get("username"), // param2 is username
                    param3: this.get("password") // param3 is password
                },
                load: lang.hitch(this, "_onLogin")
            });
        },

        /**
         * Handles the response from the TM1 Web login call.
         */
        _onLogin: function(response) {
            // If the response has a reply (indicating login succeeded)
            if(response.reply) {
                this._onSubmit();

                // Get the session token from the response
                var sessionId = response.reply.sessionToken;

                // Notifiy listeners that a login has occurred and pass along
                // the session token/id.
                this.onLogin(sessionId);
            }
            else { // If no result, login failed
                this.set("loginDisabled", false);
                alert("Login failed...");
            }
        }
    });

    return LoginDialog;
});
