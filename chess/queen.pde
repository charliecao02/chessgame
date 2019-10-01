class Queen extends Pieces{
  Queen(int _x, int _y, int _side) {
    super();
    location=new PVector(_x+0.5, _y+0.5);
    side=_side;
  }

  void show() {
    if (side==1) {
      image(b_queen, location.x*scale, location.y*scale);
    }
    if (side==0) {
      image(w_queen, location.x*scale, location.y*scale);
    }
  }

  void act() {
    if(selected==true && (selectedtype==5 || selectedtype==11)) gridcolor[clickrow][clickcol]=2;//move code
  }
}
