class Pawn extends Pieces {
  boolean firstmove;
  Pawn(int _x, int _y, int _side) {
    super();
    location=new PVector(_x+0.5, _y+0.5);
    side=_side;
    firstmove=true;
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
    if(selected==true && (selectedtype==1 || selectedtype==7)) gridcolor[clickrow][clickcol]=2;//move code
  }
}
