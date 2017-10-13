// Menu bar widget containing various actions such as recalculate, add a product, and logout.
define([
    "dojo/_base/declare",
    "dojo/_base/lang",
    "dojo/_base/array",
    "dojo/_base/xhr",
    "dijit/MenuBar",
    "dijit/DropDownMenu",
    "dijit/PopupMenuBarItem",
    "dijit/MenuItem",
    "dijit/Dialog",
    "tm1web/websheet/Workbook"
], function(declare, lang, array, xhr, MenuBarBase, DropDownMenu, PopupMenuBarItem,
        MenuItem, Dialog, Workbook) {

    var MenuBar = declare(MenuBarBase, {

        // A session token corresponding to a TM1 Web session.
        sessionToken: null,

        // Creates the DOM required for this widget. A Dojo-ism.
        buildRendering: function() {
            // Execute the base class method.
            this.inherited(arguments);

            this.domNode.className += " vision";
        },

        // Actions to take after the widget has been created. A Dojo-ism.
        postCreate: function() {
            // Execute the base class method.
            this.inherited(arguments);
            this._createActionsDropDown();
        },
        
        _createActionsDropDown: function() {
            // Create a drop down menu with various actions.
            var actionMenu = DropDownMenu();
            actionMenu.domNode.className += " vision";

            // Add a 'Recalculate' action.
            actionMenu.addChild(new MenuItem({
                label: "Recalculate",
                onClick: lang.hitch(this, "_recalculate")
            }));

            // Add an 'Add Product' action.
            actionMenu.addChild(new MenuItem({
                label: "Add Product",
                onClick: lang.hitch(this, "_addProduct")
            }));
            
            // Add an 'Add Product' action.
            actionMenu.addChild(new MenuItem({
                label: "Delete Product",
                onClick: lang.hitch(this, "_deleteProduct")
            }));

            // Add a 'Logout' action.
            actionMenu.addChild(new MenuItem({
                label: "Logout",
                onClick: lang.hitch(this, "_logout")
            }));

            // Create the top level menu button and attach the
            // drop down menu as the popup when clicked.
            this.addChild(new PopupMenuBarItem({
                label: "Actions",
                popup: actionMenu
            }));
        },

        // Recalculate all of the widgets on the dashboard.
        _recalculate: function() {
            array.forEach(this.dashboard.getWidgets(), function(widget) {
                widget.recalculate();
            });
        },

        // Opens a modal dialog containing a websheet which allows users
        // to add a new product.
        _addProduct: function() {
            var dialog = null;

            var addProduct = new Workbook({
                region: "center",
                style: "height: 100%; width: 100%;",
                sessionToken: this.sessionToken,
                path: "Applications/Applications/AddProduct.xlsm",
                tm1Server: "CarSales",
                style: "width: 500px; height: 200px; overflow: hidden;"
            });

            // Create a modal dialog which will contain the websheet.
            var self = this;
            dialog = new Dialog({
                onHide: function() {
                    // When the dialog is hidden, destroy the websheet so it can be
                    // garbage collected and recalculate all widgets on the dashboard.
                    addProduct.destroy();
                    dialog = null;
                    self._recalculate();
                }
            });

            // Add the websheet to the dialog.
            dialog.containerNode.style.padding = "0";
            dialog.containerNode.appendChild(addProduct.domNode);

            // Show the dialog and initiate the websheet lifecyle.
            dialog.show();
            addProduct.startup();
        },
        
        _deleteProduct: function() {
            var dialog = null;

            var deleteProduct = new Workbook({
                region: "center",
                style: "height: 100%; width: 100%;",
                sessionToken: this.sessionToken,
                path: "Applications/Applications/DeleteProduct.xlsm",
                tm1Server: "CarSales",
                style: "width: 500px; height: 200px; overflow: hidden;"
            });

            // Create a modal dialog which will contain the websheet.
            var self = this;
            dialog = new Dialog({
                onHide: function() {
                    // When the dialog is hidden, destroy the websheet so it can be
                    // garbage collected and recalculate all widgets on the dashboard.
                    deleteProduct.destroy();
                    dialog = null;
                    self._recalculate();
                }
            });

            // Add the websheet to the dialog.
            dialog.containerNode.style.padding = "0";
            dialog.containerNode.appendChild(deleteProduct.domNode);

            // Show the dialog and initiate the websheet lifecyle.
            dialog.show();
            deleteProduct.startup();
        },

        // Issues a logout command to TM1 Web for the current session.
        _logout: function() {
            xhr.post({
                async: false,
                url: "http://localhost:9510/tm1web/api/TM1Service/logout",
                handleAs: "json",
                content: {
                    param0: this.get("sessionToken")
                }
            });
            document.location.reload();
        }
    });

    return MenuBar;
});