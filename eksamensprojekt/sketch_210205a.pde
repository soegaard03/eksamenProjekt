
    int x = 285;
    int y = 620;
    PImage bg;

    brandmand helt;

    void setup() {
        helt = new brandmand();
        size(700,700);
        bg = loadImage("hus.jpg");
    }


void draw() {
        background(bg);
        helt.tegnBrandmand(x,y,65,65);
        
    }

void keyPressed(){ //wasd kontrollerne
        if (key == 'a' || key == 'A'){ 
             x -= 2; //bevæger sig 2 pixels til venstre
        } else if (key == 'd' || key == 'D'){
             x += 2; //2 pixels til højre
        } else if(key == 'w' || key == 'W'){
             y -= 2; // 2 pixels op
        } else if(key == 's' || key == 'S'){
             y += 2; //2 pixels ned
        }
    }
