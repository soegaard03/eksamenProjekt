import java.util.Timer;
import java.util.TimerTask;

int circleX = 100;
int circleY = 150;  // Position of circle button

int rectX = 300;
int rectY = 300;

int rectSizeX = 100;   
int rectSizeY = 70;
boolean knapRamt = false;

Timer myTimer = new Timer();
TimerTask myTask = new TimerTask() {
  public void run() {
   --countDown;
  }
};

int x = 285; //fortæller brandmandens start xkoordinat
int y = 620; //brandmands start-y
int bX = 52; //fortæller babyens start start xkoordinat
int bY = 400;//babys start-y
PImage bg;

brandmand helt;
VandTank v1;
baby bby;
Labyrint vaeg; //hey andrea det her skal med


//knap er spillet startet
Boolean erSpilletStartet = false;

void setup() {
  size(700, 700);
  bg = loadImage("hus.png"); //hey andrea husk at få det rigtige billede med 
  bg.loadPixels(); //hey andrea det her skal også med tror jeg
  
  helt = new brandmand(); 
  bby = new baby();
  vaeg = new Labyrint(); //hey andrea det her skal med

  //hvor hurtigt den tæller ned
  myTimer.schedule(myTask, 1000, 1000);
  v1 = new VandTank(); //den skal musens koordinater - skal fortælles i draw
}


void draw() {
//if knappen er trykket kommer baggrund på 

  if (erSpilletStartet) {
    background(bg);
    helt.tegnBrandmand(x, y, 65, 65);
    bby.tegnBaby(bX,bY,20,35); 
    bby.babyReddet(x+35,y+14);
 
    

    update(mouseX, mouseY);
    DisplayText();
    } else {
    update(mouseX, mouseY);
    rect(rectX,rectY,rectSizeX, rectSizeY);
    if (buttonWasClicked) {
      DisplayText();
    }
  }
  
  if(erSpilletStartet){ 
  if(keyPressed){ //starter vandet
    if(key == 'v' || key == 'V'){ //bestemmer tilkaldeknappen
      v1.addVand(new PVector(x+35, y+7)); //giver placeringen for hvor vandet skal komme fra (kan også være mouse)
      v1.run(); //displayer vandet 
    }
    }
  }

}

void update(int x, int y) {
  if ( knapRamt(rectX, rectY, rectSizeX, rectSizeY) ) {
    knapRamt = true;
  } else {
    knapRamt = false;
  }

  if (countDown < 1) {
    myTimer.cancel();
    erSpilletStartet = false;
  }
}

String textToDisplay;
Boolean buttonWasClicked = false;
int countDown = 31;

void DisplayText() {
  fill(255);
  textSize(32);
  text(countDown, 10, 30);
  textSize(32);
}

void DispalyTimer() {
}

//hey andrea det her skal skiftes ud 
void keyPressed() { //wasd kontrollerne
  if ((key == 'a' || key == 'A') && !vaeg.vskulderRamt(x,y)) { 
    x -= 1; //bevæger sig 2 pixels til venstre
  } 
  if ((key == 'd' || key == 'D') && !vaeg.hskulderRamt(x,y)) {
    x += 1; //2 pixels til højre
  } 
  if ((key == 'w' || key == 'W') && !vaeg.hovedRamt(x,y)) {
     y -= 1; // 2 pixels op 
    } 
  if ((key == 's' || key == 'S') && !vaeg.rygRamt(x,y)) {
    y += 1; //2 pixels ned
  }
   
}

void mouseClicked() {
  if (knapRamt) {
    buttonWasClicked = true;
    erSpilletStartet = true;
  }
}

boolean knapRamt(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
