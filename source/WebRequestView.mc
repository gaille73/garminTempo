import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class WebRequestView extends WatchUi.View {
    private var _message as String = "Press start button";
    private var _line1 as String = "";
    private var _line2 as String = "";
    private var _line3 as String = "";
    private var _infosRetrieved as Boolean = false;

    function initialize() {
        WatchUi.View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        if (_infosRetrieved == false) {
            var view1 = View.findDrawableById("line1") as Text;
            view1.setText("");
            var view2 = View.findDrawableById("line2") as Text;
            view2.setText(_message);
            view2.setColor(Graphics.COLOR_WHITE);
            var view3 = View.findDrawableById("line3") as Text;
            view3.setText("");
        } else {
            var view1 = View.findDrawableById("line1") as Text;
            if (_line1.equals("blue")) {
                view1.setColor(Graphics.COLOR_BLUE);
            }
            else if (_line1.equals("white")) {
                view1.setColor(Graphics.COLOR_WHITE);
            } else {
                view1.setColor(Graphics.COLOR_RED);
            }
            view1.setText(Lang.format("The day is $1$",[_line1]));
            var view2 = View.findDrawableById("line2") as Text;
            view2.setText(_line2);
            var view3 = View.findDrawableById("line3") as Text;
            view3.setText(_line3);
        }
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

    // Show the result or status of the web request
    // @param args Data from the web request, or error message
    public function onReceive(args as Dictionary or String or Null) as Void {
        if (args instanceof String) {
            _message = args;
            _infosRetrieved = false;
            if (_message.find("-104") != null) {
                _message="BLE connection\nnot available";
            } else if (_message.find("-300") != null) {
                _message="Connection\ntimed out";
            }
        } else if (args instanceof Dictionary) {
            _line1 = args["dayColor"];
            var cost = args["dayCost"];
            var formattedCost = cost.format("%.2f");
            var nbKwh = args["dayConso"];
            var formattedNbKwh = nbKwh.format("%.2f");
            _line3 = Lang.format("$1$ €",[formattedCost]);
            _line2 = Lang.format("$1$ kW/h",[formattedNbKwh]);
            _infosRetrieved =  true;
        }
        WatchUi.requestUpdate();
    }

}
