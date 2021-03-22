class VandTank{
  ArrayList<Vand> vand;
  PVector start;
  
  VandTank(PVector position) {
    start = position.copy();
    vand = new ArrayList<Vand>();
  }
  
  void addParticle() {
    vand.add(new Vand(start));
   }

  void run() {
    for (int i = 0; i < vand.size(); i++) {
     Vand p = vand.get(i);
     p.run();
      if (p.isDead()) {
      vand.remove(i);
      
    }
    }
  }
  
}
