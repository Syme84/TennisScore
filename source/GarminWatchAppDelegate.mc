import Toybox.Lang;
import Toybox.WatchUi;

class GarminWatchAppDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new GarminWatchAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}