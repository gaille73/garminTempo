import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class CountersView extends WatchUi.View {
    private var _line1 as String = "";
    private var _line2 as String = "";
    private var _line3 as String = "";

    function initialize(bRecap as String, wRecap as String, rRecap as String) {
        WatchUi.View.initialize();
        _line1 = bRecap;
        _line2 = wRecap;
        _line3 = rRecap;
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

        var view1 = View.findDrawableById("line1") as Text;
        view1.setColor(Graphics.COLOR_BLUE);
        view1.setText(_line1);
        
        var view2 = View.findDrawableById("line2") as Text;
        view2.setColor(Graphics.COLOR_WHITE);
        view2.setText(_line2);
        
        var view3 = View.findDrawableById("line3") as Text;
        view3.setColor(Graphics.COLOR_RED);
        view3.setText(_line3);
        
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

}
