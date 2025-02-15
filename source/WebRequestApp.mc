import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class WebRequestApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view for the app
    // @return Array Pair [View, Delegate]
    public function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new $.WebRequestView();
        var delegate = new $.WebRequestDelegate(view.method(:onReceive));
        return [view, delegate];
    }

}

function getApp() as WebRequestApp {
    return Application.getApp() as WebRequestApp;
}