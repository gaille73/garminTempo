//
// Copyright 2016-2021 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

import Toybox.Communications;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

// Creates a web request on menu / select events
class CountersDelegate extends WatchUi.BehaviorDelegate {
    // Set up the callback to the view
    // @param handler Callback method for when data is received
    public function initialize() {
        WatchUi.BehaviorDelegate.initialize();
    }

    // On a menu event, make a web request
    public function onKey(key) as Boolean {
        if (key.getKey() == WatchUi.KEY_UP) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            return true;
        }
        return false;
    }

}