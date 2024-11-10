import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class GarminWatchAppDelegate extends WatchUi.BehaviorDelegate {
    
    var tennisMatchModel;

    function initialize(model as TennisMatchModel) {
        BehaviorDelegate.initialize();
        tennisMatchModel = model;
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
                tennisMatchModel.increaseSetsPlayer1();
                System.println("Up Taste gedrueckt");
                System.println(tennisMatchModel.setsPlayer1.toString());
                break;
            case KEY_DOWN:
                tennisMatchModel.increaseSetsPlayer2();
                System.println("Down Taste gedrueckt");
                System.println(tennisMatchModel.setsPlayer2.toString());
                break;
        }

        WatchUi.requestUpdate();
        return true;
    }


}