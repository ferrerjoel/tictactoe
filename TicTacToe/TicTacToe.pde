// Declaració del mapa de posicions (tauler) //<>//
byte map[][] = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
// Declaració de les variables emprades per als jugadors i els intents
byte tries = 0, currentPlayer = 1, opponent;
// Declaració de la variable emprada per a determinar el jugador actual
boolean turnPlayerOne = false;
// Declaració de l'estat (0 = menú, 1 = inici del joc, 2 = fi del joc)
byte gameState = 0;
// Declaració dels comptadors de victòries
byte playerOneWins = 0, playerTwoWins = 0;
// Declaració de la variable d'imatge
PImage img;
// Declaració de variables emprades per al posicionament de fitxes
int cordX, cordY;
// Declaració de la variable que comprova si la partida acaba en empat
public static boolean isDraw;
// Declaració de les variables que compten els moviments de cada jugador
int moveCountO = 0, moveCountX = 0;

// Declaració d'instancies
TokenO o1, o2, o3, o4;
TokenX x1, x2, x3, x4;

/**
 * Joc del tres en ratlla
 * @author Joel Ferrer, Jan Pérez, Pol Renalias
 */
public void setup() {
  size(1280, 720);
  background(30);
  surface.setTitle("Tic-Tac-Toe");
  frameRate(60);
  img = loadImage("x.png");
}

/**
 * Mètode per a inicialitzar el programa (menú)
 */
void draw() {
  if (gameState == 0) {
    //Va per sectors, primer fem les animacions del menu, despres tenim al menu
    //i per acabar estan les opcions depenent del que seleccioni l'usuari
    switch(state) {
    case 0:
      titleanim();
      break;
    case 1:
      if (size<100) {
        menu();
      }
      checkop(555, 200, 730, 260, posX, posY-100, "PLAY");
      checkop(470, 300, 820, 370, posX, posY, "OPTIONS");
      checkop(565, 400, 720, 460, posX, posY+100, "EXIT");
      textSize(30);
      text("Made by Joel F. Jan P. & Pol R.", 1055, 680);
      textSize(90);
      if (play) {
        gameState = 1;
        gameInitialSetup();
      } else if (options) {
        state = 2;
        background(30);
        textAlign(CENTER);
        textSize(70);
        text("There is no options in a Tic Tac Toe", 640, 360);
        textSize(90);
      } else if (exit) {
        state = 3;
      }
      break;
    case 2:
      delay(1500);
      background(30);
      options = false;
      state = 1;
      break;
    case 3:
      exit();
      break;
    }
  }
}

/**
 * Mètode per a inicialitzar la partida
 */
void gameInitialSetup() {
  background(30);
  textAlign(BASELINE);
  createTokens();
  colorizeO();
  allocateO();
  allocateX();
  drawBoard();
  printCurrentPlayer();
  printCurrentWins();
  printMessageBox("Game start");
  stroke(255);
  strokeWeight(8);
}

/**
 * Mètode emprat per a inicialitzar les fitxes
 * (raó de ser: cridat per varis mètodes)
 */
void createTokens() {
  o1 = new TokenO();
  o2 = new TokenO();
  o3 = new TokenO();
  o4 = new TokenO();
  x1 = new TokenX(img);
  x2 = new TokenX(img);
  x3 = new TokenX(img);
  x4 = new TokenX(img);
}


/**
 * Mètode per a definir quin jugador esta jugant actualment
 */
void currentPlayerMethod() {
  if (!turnPlayerOne) {
    currentPlayer = 2;
    opponent = 1;
    turnPlayerOne = true;
  } else {
    currentPlayer = 1;
    opponent = 2;
    turnPlayerOne = false;
  }
}

// Mètode emprat per guardar els valors del taulell en una llista
public boolean checkPosition (byte row, byte column) {
  String position = ""+row+","+column;
  if (map[row][column] == 0) {
    map[row][column] = currentPlayer;
    printMessageBox("Move to "+position);
    return true;
  }
  printMessageBox("Already in use");
  return false;
}
/**
 * Mètode que comprova si el jugador fa click al ratoli
 * i actua en consequencia
 */
void mouseClicked() {
  if (gameState == 1) {
    printCurrentPlayer();
    checkTable();
  }
  if (gameState == 0) {
    if (mouseX > 555 &&  mouseX < 730 && mouseY > 200 && mouseY < 260) {
      play = true;
      //Selecció "opcions"
    } else if (mouseX > 470 &&  mouseX < 820 && mouseY > 300 && mouseY < 370) {
      options = true;
      ///Selecció "sortir"
    } else if (mouseX > 565 &&  mouseX < 720 && mouseY > 400 && mouseY < 460) {
      exit = true;
    }
  }
}
/**
 * Mètode que mira si el jugador perm la tecla R
 * i crida el mètode de reinici
 */
void keyPressed() {
  switch (key) {
  case 'r':
    if (gameState == 2) restartGame();
    break;
  }
}

/**
 * Mètode que s'utilitza per a començar una nova partida (reinici de valors)
 */
void restartGame() {
  moveCountO = 0;
  moveCountX = 0;
  createTokens();
  colorizeO();
  allocateO();
  allocateX();
  drawBoard();
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map.length; j++) {
      map[i][j] = 0;
    }
  }
  gameState = 1;
  printMessageBox("Game start");
  printCurrentWins();
  printCurrentPlayer();
}
