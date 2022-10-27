/**
 * Mètode que serveix per a dibuixar el taulell
 */
void drawBoard() {
  fill(60);
  stroke(1);
  strokeWeight(1);
  for (int i = 340; i < 940; i+=200) {
    for (int j = 60; j < 660; j+=200) {
      rect(i, j, 200, 200);
    }
  }
}

/**
* Mètode que serveix per a afegir el color a les fitxes O
*/
void colorizeO() {
  color c1 = color(random(255), random(255), random(255));
  color c2 = color(random(255), random(255), random(255));
  color c3 = color(random(255), random(255), random(255));
  color c4 = color(random(255), random(255), random(255));
  o1.setColor(c1);
  o2.setColor(c2);
  o3.setColor(c3);
  o4.setColor(c4);
}

/**
* Mètode que serveix per a posicionar les fitxes X
*/
void allocateX() {
  switch (moveCountX) {
  case 0:
    x2.setPosY(250);
    x3.setPosY(270);
    x4.setPosY(290);
    x4.display(x4.getImage(), x4.getPosX(), x4.getPosY());
    x3.display(x3.getImage(), x3.getPosX(), x3.getPosY());
    x2.display(x2.getImage(), x2.getPosX(), x2.getPosY());
    x1.display(x1.getImage(), x1.getPosX(), x1.getPosY());
    break;
  case 1:
    eraseX(x4);
    x2.setPosY(230);
    x3.setPosY(250);
    x4.setPosY(270);
    x4.display(x4.getImage(), x4.getPosX(), x4.getPosY());
    x3.display(x3.getImage(), x3.getPosX(), x3.getPosY());
    x2.display(x2.getImage(), x2.getPosX(), x2.getPosY());
    break;
  case 2:
    eraseX(x4);
    x3.setPosY(230);
    x4.setPosY(250);
    x4.display(x4.getImage(), x4.getPosX(), x4.getPosY());
    x3.display(x3.getImage(), x3.getPosX(), x3.getPosY());
    break;
  case 3:
    eraseX(x4);
    x4.setPosY(230);
    x4.display(x4.getImage(), x4.getPosX(), x4.getPosY());
    break;
  case 4:
    eraseX(x4);
    break;
  }
}

/**
* Mètode que esborra les fitxes X que ja han estat colocades al taulell de la seva anterior posició
*/
void eraseX(TokenX t) {
  fill(30);
  stroke(30);
  square(t.getPosX(), t.getPosY(), 170);
}

/**
* Mètode que dibuixa (i emplena) les fitxes O
*/
void drawO(TokenO t) {
  fill (t.getColor());
  ellipse(t.getPosX(), t.getPosY(), t.getDiameter(), t.getDiameter());
}
 
/**
* Mètode que esborra les fitxes O que ja han estat colocades al taulell de la seva anterior posició
*/
void eraseO(TokenO t) {
  fill(30);
  stroke(30);
  ellipse(t.getPosX(), t.getPosY(), t.getDiameter()+3, t.getDiameter()+3);
}

/**
* Mètode que posiciona les fitxes O
*/
void allocateO() {
  switch (moveCountO) {
  case 0:
    o2.setPosY(320);
    o3.setPosY(340);
    o4.setPosY(360);
    drawO(o4);
    drawO(o3);
    drawO(o2);
    drawO(o1);
    break;
  case 1:
    eraseO(o4);
    o2.setPosY(300);
    o3.setPosY(320);
    o4.setPosY(340);
    drawO(o4);
    drawO(o3);
    drawO(o2);
    break;
  case 2:
    eraseO(o4);
    o3.setPosY(300);
    o4.setPosY(320);
    drawO(o4);
    drawO(o3);
    break;
  case 3:
    eraseO(o4);
    o4.setPosY(300);
    drawO(o4);
    break;
  case 4:
    eraseO(o4);
    break;
  }
}

/**
* Mètode que imprimeix el recuadre esquerra|superior
*/ 
void printCurrentPlayer() {
  strokeWeight(1);
  stroke(0);
  fill(60);
  rect(50, 60, 250, 50);
  textSize(32);
  fill(255);
  if (gameState == 1) {
    text("Player "+currentPlayer, 70, 95);
  } else if (gameState == 2 && !isDraw) {
    text("Player "+opponent+ " wins!", 70, 95);
  } else if (checkDrawMap(map)) {
    text("Draw", 70, 95);
  }
}

/**
* Mètode que serveix per a imprimir les fitxes (Si es 1 => X, si es 2 => O)
*/
void playerPrint(byte currentPlayer, int cordX, int cordY, int i, int j) {
  if (currentPlayer == 2) {
    switch (moveCountO) {
    case 0:
      moveCountO++;
      allocateO();
      o1.setPosX(cordX+100);
      o1.setPosY(cordY+100);
      drawO(o1);
      break;
    case 1:
      moveCountO++;
      allocateO();
      o2.setPosX(cordX+100);
      o2.setPosY(cordY+100);
      drawO(o2);
      break;
    case 2:
      moveCountO++;
      allocateO();
      o3.setPosX(cordX+100);
      o3.setPosY(cordY+100);
      drawO(o3);
      break;
    case 3:
      moveCountO++;
      allocateO();
      o4.setPosX(cordX+100);
      o4.setPosY(cordY+100);
      drawO(o4);
      break;
    case 4:
      allocateO();
      o4.setPosX(cordX+100);
      o4.setPosY(cordY+100);
      drawO(o4);
      break;
    }
  } else {
    switch (moveCountX) {
    case 0:
      moveCountX++;
      allocateX();
      x1.setPosX(i+15);
      x1.setPosY(j+15);
      x1.display(x1.getImage(), x1.getPosX(), x1.getPosY());
      break;
    case 1:
      moveCountX++;
      allocateX();
      x2.setPosX(i+15);
      x2.setPosY(j+15);
      x2.display(x2.getImage(), x2.getPosX(), x2.getPosY());
      break;
    case 2:
      moveCountX++;
      allocateX();
      x3.setPosX(i+15);
      x3.setPosY(j+15);
      x3.display(x3.getImage(), x3.getPosX(), x3.getPosY());
      break;
    case 3:
      moveCountX++;
      allocateX();
      x4.setPosX(i+15);
      x4.setPosY(j+15);
      x4.display(x4.getImage(), x4.getPosX(), x4.getPosY());
      break;
    }
  }
}

/**
* Mètode que imprimeix el recuadre central|superior amb les victories actuals
*/
void printCurrentWins() {
  strokeWeight(1);
  stroke(0);
  fill(160);
  rect(510, 5, 250, 50);
  textSize(32);
  fill(0);
  text("P1 [ "+playerOneWins+" - "+playerTwoWins+" ] P2", 550, 40);
}

/**
* Mètode que imprimeix el recuadre dret|superior amb el missatge d'estat
*/
void printMessageBox(String message) {
  strokeWeight(1);
  stroke(0);
  fill(60);
  rect(980, 60, 250, 50);
  textSize(32);
  fill(255);
  text(message, 1000, 95);
}

/**
* Mètode que imprimeix un recuadre a sobre del taulell de color verd al fi de la partida
*/
void endSquare() {
  fill(0, 127, 0, 60);
  rect(340, 60, 600, 600);
}
