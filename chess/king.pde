class King extends Pieces {
  int x, y;
  King(int _x, int _y, int _side) {
    super();
    location=new PVector(_x+0.5, _y+0.5);
    side=_side;
    x=_x;
    y=_y;
  }

  void show() {
    if (side==1) {
      image(b_king, location.x*scale, location.y*scale);
    }
    if (side==0) {
      image(w_king, location.x*scale, location.y*scale);
    }
  }

  void act() {
    if (selected==true && (selectedtype==6 || selectedtype==12)) {
      gridcolor[clickrow][clickcol]=2;
    }
    if (selected==false && (selectedtype==6 || selectedtype==12)) gridcolor[clickrow][clickcol]=prevcolor;
  }
}
