import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class GarminWatchAppApp extends Application.AppBase {

    var tennisMatchModel;

    function initialize() {
        AppBase.initialize();

        tennisMatchModel = new TennisMatchModel();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void 
    {
    
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new GarminWatchAppView(tennisMatchModel);
        var delegate = new GarminWatchAppDelegate(tennisMatchModel);
        return [ view, delegate ];
    }

}

function getApp() as GarminWatchAppApp {
    return Application.getApp() as GarminWatchAppApp;
}