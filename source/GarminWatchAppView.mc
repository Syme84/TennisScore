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

    // Defines the colors
    var customGreen = 0x00713d;
    var customPurple = 0x4f2684;
    var white = 0xffffff;
    var backgroundColor = 0xc4c4c4;


    function initialize(model as TennisMatchModel) {
        View.initialize();
        tennisMatchModel = model;
    }

    // Load your resources here
    function onLayout(dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        drawBackground(dc);
        drawTable(dc);
    }


    function drawBackground(dc) {
        dc.setColor(Graphics.COLOR_WHITE, backgroundColor);
        dc.clear();
    }

    function drawTable(dc) as Void {
       // Get screen dimensions
       var screenWidth = dc.getWidth();
       var screenHeight = dc.getHeight();

       // Table configuration
       var cellWidth = (screenWidth - 40) / 4;  
       var cellHeight = cellWidth;  
       var tableX = 20;   
       var tableY = (screenHeight / 2) - cellHeight; 
       var tableDimensionsModel = new TableDimensionsModel(tableX, tableY, cellWidth, cellHeight); 

       // Draws the table with the score in every cell
       drawPlayerNameCell(dc, tableDimensionsModel, 0, white, "P1", customPurple, true);
       drawPlayerNameCell(dc, tableDimensionsModel, 1, white, "P2", customPurple, false);
       drawCellOfTable(dc, tableDimensionsModel, 1, 0, customGreen, tennisMatchModel.setsPlayer1.toString(), white);
       drawCellOfTable(dc, tableDimensionsModel, 1, 1, customGreen, tennisMatchModel.setsPlayer2.toString(), white);
       drawCellOfTable(dc, tableDimensionsModel, 2, 0, customPurple, tennisMatchModel.gamesPlayer1.toString(), white);
       drawCellOfTable(dc, tableDimensionsModel, 2, 1, customPurple, tennisMatchModel.gamesPlayer2.toString(), white);

       // Shows AD instead of -1 when some player has advantage
       var player1Player2Text = adjustStringForAdvantageCase(tennisMatchModel.pointsPlayer1, tennisMatchModel.pointsPlayer2);
       drawPointsCell(dc, tableDimensionsModel, 0, white, player1Player2Text[0], customPurple);
       drawPointsCell(dc, tableDimensionsModel, 1, white, player1Player2Text[1], customPurple);
    }

    function drawPlayerNameCell(dc, tableDimensions, rowNumber, color, textInCell, textColor, hasServ)
    {
       // Draw the background color of the cell
       var x = 0;
       var y = tableDimensions.y + rowNumber * tableDimensions.cellHeight;
       var cellWidth = tableDimensions.cellWidth + 20;
       dc.setColor(color, color);
       dc.fillRectangle(x, y, cellWidth, tableDimensions.cellHeight);

       // Draws the current score of the cell
       dc.setColor(textColor, Graphics.COLOR_TRANSPARENT);
       var fontHeight = dc.getFontHeight(Graphics.FONT_LARGE); 
       var textY = y + (tableDimensions.cellHeight / 2) - (fontHeight / 2);
       dc.drawText(cellWidth/2, textY, Graphics.FONT_LARGE, textInCell, Graphics.TEXT_JUSTIFY_CENTER);

       if (hasServ)
       {
          dc.setColor(customGreen, Graphics.COLOR_TRANSPARENT);
          dc.fillCircle(cellWidth - 12.5, y + (tableDimensions.cellHeight / 2), 5);
       }

    }

    function drawPointsCell(dc, tableDimensions, rowNumber, color, textInCell, textColor)
    {
        var x = 170;
        var y = tableDimensions.y + rowNumber * tableDimensions.cellHeight;
        var cellWidth = tableDimensions.cellWidth+20;
        dc.setColor(color, color);
        dc.fillRectangle(x, y, cellWidth, tableDimensions.cellHeight);

        // Draws the current score of the cell
        dc.setColor(textColor, Graphics.COLOR_TRANSPARENT);
        var fontHeight = dc.getFontHeight(Graphics.FONT_LARGE); 
        var textY = y + (tableDimensions.cellHeight / 2) - (fontHeight / 2);
        dc.drawText(x+(cellWidth/2), textY, Graphics.FONT_LARGE, textInCell, Graphics.TEXT_JUSTIFY_CENTER);
    }
    

    function drawCellOfTable(dc, tableDimensions, columnNumber, rowNumber, color, textInCell, textColor) {
       // Draw the background color of the cell
       var x = tableDimensions.x + columnNumber * tableDimensions.cellWidth;
       var y = tableDimensions.y + rowNumber * tableDimensions.cellHeight;
       dc.setColor(color, color);
       dc.fillRectangle(x, y, tableDimensions.cellWidth, tableDimensions.cellHeight);

       // Draws the current score of the cell
       dc.setColor(textColor, Graphics.COLOR_TRANSPARENT);
       var fontHeight = dc.getFontHeight(Graphics.FONT_LARGE); 
       var textY = y + (tableDimensions.cellHeight / 2) - (fontHeight / 2);
       dc.drawText(x+tableDimensions.cellWidth/2, textY, Graphics.FONT_LARGE, textInCell, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function adjustStringForAdvantageCase(pointsPlayer1, pointsPlayer2){
        // Player1 has advantage
        if (pointsPlayer1 == -1)
        {
            return ["AD", ""];
        }

        // Player2 has advantage
        if (pointsPlayer2 == -1)
        {
            return ["", "AD"];
        }

        // When neither of the two players has advantage 
        return [pointsPlayer1.toString(), pointsPlayer2.toString()];
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
