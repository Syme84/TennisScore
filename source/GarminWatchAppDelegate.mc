import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class GarminWatchAppDelegate extends WatchUi.BehaviorDelegate {
    
    private var scorePlayer1 = 0;
    private var scorePlayer2 = 0;


    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new GarminWatchAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(keyEvent)
    {
        switch(keyEvent.getKey())
        {
            case KEY_UP:
                System.println("Up Taste gedrueckt");
                break;
            case KEY_DOWN:
                System.println("Down Taste gedrueckt");
                break;
        }

        return true;
    }


}