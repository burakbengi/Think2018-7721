
/**
 * A container module for widgets to be placed on the dashboard.
 */
define([
    "dojo/_base/declare",
    "dojo/dom-construct",
    "dojo/aspect",
    "dijit/_WidgetBase",
    "dojox/layout/ResizeHandle"
], function(declare, domConstruct, aspect, _WidgetBase, ResizeHandle) {
    
    var WidgetContainer = declare(_WidgetBase, {
        
        /**
         * The widget that this container will contain.
         */
        widget: null,
        
        /**
         * Creates the DOM required for this widget. A Dojo-ism.
         */
        buildRendering: function() {
            // Execute the base class method.
            this.inherited(arguments);
            
            // Set some styles on the container.
            this.domNode.style.border = "1px solid #769DC0";
            this.domNode.style.boxShadow = "0 1px 5px rgba(0, 0, 0, 0.25)";
            this.domNode.style.position = "absolute";
        },
        
        /**
         * Initiates the startup process for the widget's lifecyle. A Dojo-ism.
         */
        startup: function() {
            // Execute the base class method.
            this.inherited(arguments);
            
            // Add the widget to the container and startup the widget.
            domConstruct.place(this.widget.domNode, this.domNode);
            this.widget.startup();
        }
    });
    
    return WidgetContainer;
});