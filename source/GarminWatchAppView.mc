import Toybox.Graphics;
import Toybox.WatchUi;

class GarminWatchAppView extends WatchUi.View {
 
    var tennisMatchModel;

    var lblSetsPlayer1;
    var lblSetsPlayer2;
    var lblGamesPlayer1;
    var lblGamesPlayer2;
    var lblPointsPlayer1;
    var lblPointsPlayer2;


    function initialize(model as TennisMatchModel) {
        View.initialize();
        tennisMatchModel = model;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        lblSetsPlayer1 = self.findDrawableById("lblSetsPlayer1") as Text;
        lblSetsPlayer2 = self.findDrawableById("lblSetsPlayer2") as Text;
        lblGamesPlayer1 = self.findDrawableById("lblGamesPlayer1") as Text;
        lblGamesPlayer2 = self.findDrawableById("lblGamesPlayer2") as Text;
        lblPointsPlayer1 = self.findDrawableById("lblPointsPlayer1") as Text;
        lblPointsPlayer2 = self.findDrawableById("lblPointsPlayer2") as Text;

        lblSetsPlayer1.setText(tennisMatchModel.setsPlayer1.toString());
        lblSetsPlayer2.setText(tennisMatchModel.setsPlayer2.toString());
        lblGamesPlayer1.setText(tennisMatchModel.gamesPlayer1.toString());
        lblGamesPlayer2.setText(tennisMatchModel.gamesPlayer2.toString());

        // Shows AD instead of -1 when some player has advantage
        // Shows "AD" instead of -1 when a player has advantage
        lblPointsPlayer1.setText(tennisMatchModel.pointsPlayer1 == -1 ? "AD" : tennisMatchModel.pointsPlayer1.toString());
        lblPointsPlayer2.setText(tennisMatchModel.pointsPlayer2 == -1 ? "AD" : tennisMatchModel.pointsPlayer2.toString());


        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
