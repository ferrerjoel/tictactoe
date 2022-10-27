/**
* Objecte per a les fitxes O
*/
public class TokenO {
  private int posX;
  private int posY;
  private final int DIAM = 160;
  private color c;

  // Constructor de les fitxes O
  TokenO() {
    posX = 180;
    posY = 300;
    c = color(0, 0, 0);
  }

  // Mètode getter de la posició (x)
  int getPosX() {
    return posX;
  }

  // Mètode setter de la posició (x)
  void setPosX(int x) {
    this.posX = x;
  }

  // Mètode getter de la posició (y)
  int getPosY() {
    return posY;
  }

  // Mètode setter de la posició (x)
  void setPosY(int y) {
    this.posY = y;
  }

  // Mètode getter del color
  color getColor() {
    return c;
  }

  // Mètode getter del diàmetre
  int getDiameter() {
    return DIAM;
  }

  // Mètode setter del color
  void setColor(color c) {
    this.c = color(c);
  }
}

/**
 * Objecte per a les fitxes X
 */
public class TokenX {
  private PImage i;
  private int posX;
  private int posY;

  // Constructor de les fitxes X
  TokenX(PImage img) {
    i = img;
    posX = 1030;
    posY = 230;
  }
  
  // Mètode getter de la imatge
  PImage getImage() {
    return i;
  }

  // Mètode utilitzar per a mostrat la imatge
  void display(PImage i, int posX, int posY) {
    image(i, posX, posY);
  }
  
  // Mètode getter de la posició (x)
  int getPosX() {
    return posX;
  }

  // Mètode setter de la posició (x)
  void setPosX(int x) {
    this.posX = x;
  }
  
  // Mètode getter de la posició (y)
  int getPosY() {
    return posY;
  }

  // Mètode setter de la posició (y)
  void setPosY(int y) {
    this.posY = y;
  }
}
