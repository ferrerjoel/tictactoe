// Variables globals emprades per a l'execucio del menu
int state = 0;
boolean play = false;
boolean options = false;
boolean exit = false;
int posX=640;
int posY=0;
int size=100;

/**
* Crida als metodes per realitzar la animació completa del titol
*/
void titleanim(){
  // baixa el titol
  if (posY<360) {
    title("TIC TAC TOE");
    // desapareix
  } else if (size>0) {
    remtitle("TIC TAC TOE");
  } else {
    background(30);
    state = 1;
  }
}

/**
* Un text baixa des d'amunt fins que esta al centre de la pantalla
* @param s Es un text (El titol)
*/
void title(String s) {
  background(30);
  textSize(size);
  textAlign(CENTER);
  fill(200);
  text(s, posX, posY);
  posY += 10;
  // Quan arriba al centre fa un delay per ajudar-nos en la seguent animacio
  if (posY==360) {
  delay(1000);
  }
}
/**
* Mètode que fa el text petit fins que desaparegui
* @param s Es un text (El titol)
*/
void remtitle(String s) {
  background(30);
  textSize(size+10);
  textAlign(CENTER);
  fill(200);
  text(s, posX, posY);
  //Fins que el titol no existeix el fem petit de manera progressiva
  if (size>0) {
  size -= 10;
  }
}
/**
* Mètode que crea un menu amb les opcions "jugar, opcions i sortir"
*/
void menu() {
  background(30);
  textSize(size);
  fill(200);
  text("PLAY", posX, posY-100);
  text("OPTIONS", posX, posY);
  text("EXIT", posX, posY+100);
  size+=10;
}

/**
* Donant-li un text i les cordenades que aquest ocupa l'escriu i mira si el ratoli esta sobre del mateix, si ho esta "l'ilumina"
* @param posXcheck Es la cordenada X inicial del cuadrat que envolta el text
* @param posYcheck Es la cordenada Y inicial del cuadrat que envolta el text
* @param nextXcheck Es la cordenada X final del cuadrat que envolta el text
* @param nextYcheck Es la cordenada Y final del cuadrat que envolta el text
* @param posX Es la cordenada X d'on ha de posar el text 
* @param posY Es la cordenada Y d'on ha de posar el text 
* @param s Es el text
*/
void checkop(int posXcheck, int posYcheck, int nextXcheck, int nextYcheck, int posX, int posY, String s) {
  if (mouseX > posXcheck &&  mouseX < nextXcheck && mouseY > posYcheck && mouseY < nextYcheck) {
  textSize(90);
  textAlign(CENTER);
  fill(255);
  text(s, posX, posY);
  } else {
  fill(200);
  text(s, posX, posY);
  }
}
