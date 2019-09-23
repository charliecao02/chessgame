class Pawn extends Pieces {
  Pawn(int _x, int _y, int _side) {
    super();
    location=new PVector(_x+0.5, _y+0.5);
    side=_side;
  }

  void show() {
    if (side==1) {
      image(b_pawn, location.x*scale, location.y*scale);
    }
    if (side==0) {
      image(w_pawn, location.x*scale, location.y*scale);
    }
  }

  void act() {
    
  }
}
