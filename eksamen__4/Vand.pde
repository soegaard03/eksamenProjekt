class Vand {
  PVector position;
  PVector hastighed;
  PVector acceleration;
  float livstid;
  
 Vand(PVector l) {
    acceleration = new PVector(0, 0.1);
    hastighed = new PVector(random(-1, 1), random(-2, 3));
    position = l.copy();
    livstid = 20.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    hastighed.add(acceleration);
    position.add(hastighed);
    livstid -= 2;
  }

  // Method to display
  void display() {
    stroke(6, 189, 231, livstid);
    fill(6, 189, 231, livstid);
    ellipse(position.x, position.y, 10, 10);
  }
  // Is the particle still useful?
  boolean isDead() {
    if (livstid < 0.0) {
      return true;
    } else {
      return false;
    }
  }
 }
