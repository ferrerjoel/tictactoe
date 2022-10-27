/**
 * Mètode que defineix les caselles del taulell i realitza les comprovacions adhients
 */
void checkTable() {
  int countI = 0, countJ = 0;
  int cordXNext, cordYNext;
  for (int i = 340; i < 940; i+=200) {
    for (int j = 60; j < 660; j+=200) {
      cordX = i;
      cordY = j;
      cordXNext = i+200;
      cordYNext = j+200;
      if (mouseX > cordX & mouseX < cordXNext & mouseY > cordY & mouseY < cordYNext) {
        printMessageBox(" ");
        if (checkPosition((byte)countI, (byte) countJ)) {
          playerPrint(currentPlayer, cordX, cordY, i, j);
          if (checkWinMap(map, currentPlayer)) {
            gameState = 2;
            addWins();
            printMessageBox("\'R\' to restart");
            endSquare();
          } else if (checkDrawMap(map)) {
            gameState = 2;
            printMessageBox("\'R\' to restart");
            endSquare();
          }
          currentPlayerMethod();
          printCurrentPlayer();
          isDraw = false;
        }
      }
      countJ++;
    }
    countJ = 0;
    countI++;
  }
}
/**
 * Mètode utilitzat per a afegir les victòries al comptador
 */
void addWins() {
  if (currentPlayer == 1) {
    playerOneWins++;
  } else {
    playerTwoWins++;
  }
}

/**
 * Mètode utilitzat per a comprocar si s'ha arribat a la  victòria
 * @param map Llistat de les posicions
 * @param currPlayer Jugador actual
 */
public static boolean checkWinMap(byte[][] map, byte currPlayer) {

  boolean check = false;
  byte counterRow = 0, counterColumn = 0, counterDiagonallyRight = 0, counterDiagonallyLeft = 0;
  // Comprovem tots els casos possibles
  for (byte i = 0; i < map.length; i++) {
    for (byte j = 0; j < map.length; j++) {
      if (map[i][j] == currPlayer)
        counterRow++;
      if (map[j][i] == currPlayer)
        counterColumn++;
      // La diagonal de a dalt a la esquerra cap abaix a la dreta és fa mirant si les
      // posicions on i i j son iguals
      // De aquesta manera es forma la diagonal
      if (i == j && map[i][j] == currPlayer)
        counterDiagonallyRight++;
      // La diagonal de a dalt a la dreta cap abaix a la esquerra és fa mirant les
      // posicions on la suma de i i j és 6,
      // De aquesta manera es forma la diagonal
      if ((i + j == 2) && (map[i][j] == currPlayer))
        counterDiagonallyLeft++;
    }
    // Si hi ha "3" en algun dels comptadors és que s'ha fet 3 en ratlla
    if (counterRow == 3 || counterColumn == 3 || counterDiagonallyRight == 3 || counterDiagonallyLeft == 3)
      check = true;
    counterRow = 0;
    counterColumn = 0;
  }

  return check;
}

/**
 * Metode utilitzat per comprovar si la partida ha acabat en empat
 * @param map Llistat de les posicions
 */
public static boolean checkDrawMap(byte[][] map) {
  boolean veredict = false;
  byte counter = 0;
  // Mirem totes les posicions, si son diferents del valor per defecte " " vol dir
  // que ja esta ocupada
  for (byte i = 0; i < map.length; i++) {
    for (byte j = 0; j < map.length; j++) {
      if (map[i][j] != 0)
        counter++;
    }
  }
  // Si s'han ocupat nou posicions el mapa esta ple
  if (counter == 8) {
    veredict = true;
    isDraw = true;
  }
  return veredict;
}
