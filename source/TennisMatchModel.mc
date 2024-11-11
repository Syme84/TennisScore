class TennisMatchModel {
    var setsPlayer1 = 0;
    var setsPlayer2 = 0;
    var gamesPlayer1 = 0;
    var gamesPlayer2 = 0;
    var pointsPlayer1 = 0;
    var pointsPlayer2 = 0;

    // Methods for player1
    function increaseSetsPlayer1() as Void {
        setsPlayer1++;
    }

    function increaseGamesPlayer1() as Void {
        switch(gamesPlayer1){
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
                gamesPlayer1++;
                break;
            case 5:
                if (gamesPlayer2 <= 4)
                {
                    increaseSetsPlayer1();
                }
                else 
                {
                    gamesPlayer1++;
                }
                break;
            case 6:
                if (gamesPlayer2 <= 5)
                {
                    gamesPlayer1 = 0;
                    gamesPlayer2 = 0;
                    increaseSetsPlayer1();
                }
                else
                {
                    // Tiebreak
                }
                break;
        }
    }

    function increasePointsPlayer1() as Void {
        switch(pointsPlayer1){
            case 0:
                pointsPlayer1 = 15;
                break;
            case 15:
                pointsPlayer1 = 30;
                break;
            case 30:
                pointsPlayer1 = 40;
                break;
            case 40:
                // Deuce between player 1 and player2
                if (pointsPlayer2 == 40)
                {
                    pointsPlayer1 = -1;
                }
                // Advantage player2
                else if (pointsPlayer2 == -1)
                {
                    pointsPlayer1 = 40;
                    pointsPlayer2 = 40;
                }
                // Win player1 because player2 has less than 40 points
                else
                {
                    pointsPlayer1 = 0;
                    pointsPlayer2 = 0;
                    increaseGamesPlayer1();
                }
                break;
            case -1:
                // Advantage player1 -> wins the game
                pointsPlayer1 = 0;
                pointsPlayer2 = 0;
                increaseGamesPlayer1();
                break;
        }
    }


    // Methods for player2
    function increaseSetsPlayer2() as Void {
        setsPlayer2 ++;
    }

    function increaseGamesPlayer2() as Void {
        switch(gamesPlayer2){
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
                gamesPlayer2++;
                break;
            case 5:
                if (gamesPlayer1 <= 4)
                {
                    increaseSetsPlayer2();
                }
                else 
                {
                    gamesPlayer2++;
                }
                break;
            case 6:
                if (gamesPlayer1 <= 5)
                {
                    increaseSetsPlayer2();
                }
                else
                {
                    // Tiebreak
                }
                break;
        }
    }

    function increasePointsPlayer2() as Void {
        switch(pointsPlayer2){
            case 0:
                pointsPlayer2 = 15;
                break;
            case 15:
                pointsPlayer2 = 30;
                break;
            case 30:
                pointsPlayer2 = 40;
                break;
            case 40:
                // Deuce between player 1 and player2
                if (pointsPlayer1 == 40)
                {
                    pointsPlayer2 = -1;
                }
                // Advantage player1
                else if (pointsPlayer1 == -1)
                {
                    pointsPlayer1 = 40;
                    pointsPlayer2 = 40;
                }
                // Win player2 because player1 has less than 40 points
                else
                {
                    pointsPlayer1 = 0;
                    pointsPlayer2 = 0;
                    increaseGamesPlayer2();
                }
                break;
            case -1:
                // Advantage player2 -> wins the game
                pointsPlayer1 = 0;
                pointsPlayer2 = 0;
                increaseGamesPlayer2();
                break;
        }
    }
}