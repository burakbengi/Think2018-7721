define([
    "dojo/_base/declare",
    "dojo/_base/lang",
    "dojo/_base/array",
    "dijit/layout/ContentPane",
    "tm1web/websheet/Workbook",
    "./WidgetContainer"
], function(declare, lang, array, ContentPane, Workbook, WidgetContainer) {

    var Dashboard = declare(ContentPane, {

        // A session token corresponding to a TM1 Web session.
        sessionToken: null,

        // Creates the DOM required for this widget. A Dojo-ism.
        buildRendering: function() {
            // Execute the base class method.
            this.inherited(arguments);

            this.domNode.style.padding = "20px";
        },

        // Actions to take after the widget has been created. A Dojo-ism.
        postCreate: function() {
            // Execute the base class method.
            this.inherited(arguments);
            this._createWorkbooks();
        },
        
        _createWorkbook: function(args) {
            var onSubnmChange = lang.hitch(this, "_onSubnmChange");
            // Instantiate a container with a workbook inside
            // and place it on the dashboard.
            var widget = new WidgetContainer({
                widget: new Workbook({
                    region: args.region,
                    style: args.style,
                    sessionToken: args.sessionToken,
                    path: args.path,
                    tm1Server: args.tm1Server,
                    onTitleDimensionElementChange: function(subnmInfo) {
                        // When a title is changed, apply the same information to
                        // other widgets in the dashboard.
                        onSubnmChange(this, subnmInfo);
                    }
                }),
                style: args.containerStyle
            }).placeAt(this.containerNode);
            
            widget.startup();
            
            return widget;
        },
        
        _createWorkbooks: function() {
            
            var containers = this._widgetContainers = [];
            
            var widget = this._createWorkbook({
                containerStyle: "width:1050px; height: 550px;",
                region: "center",
                style: "height: 100%; width: 100%;",
                sessionToken: this.sessionToken,
                path: "Applications/Applications/dynamicReport.xlsx",
                tm1Server: "CarSales"
            });
            
            containers.push(widget);
            
            widget = this._createWorkbook({
                containerStyle: "width:1280px; height: 640px; top: 620px;",
                region: "center",
                style: "height: 100%; width: 100%;",
                sessionToken: this.sessionToken,
                path: "Applications/Applications/SUVWorldSales.xlsx",
                tm1Server: "CarSales"
            });
            
            containers.push(widget);
            
            widget = this._createWorkbook({
                containerStyle: "width:850px; height: 550px; right: 30px;",
                region: "center",
                style: "height: 100%; width: 100%;",
                sessionToken: this.sessionToken,
                path: "Applications/Applications/Chart_only.xlsx",
                tm1Server: "CarSales"
            });
            
            containers.push(widget);

        },
        
        // Returns a collection of all widgets by aggregating the
        // widgets inside of all widget containers on the dashboard.
        getWidgets: function() {
            // array.map() iterates all the elements in an array, passing them
            // to the callback function and then returning a new array with any
            // of the modified results.
            return array.map(this._widgetContainers, function(widgetContainer) {
                return widgetContainer.widget;
            });
        },
        
        _onSubnmChange: function(source, subnmInfo) {
            subnmInfo.rawIndex = null;
            subnmInfo.columnIndex = null;
            array.forEach(this.getWidgets(), function(widget) {
                if(widget !== source) {
                    widget.set("subset", subnmInfo);
                }
            });
        }

    });

    return Dashboard;
});
