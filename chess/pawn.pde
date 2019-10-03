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
    if (selected==true && (selectedtype==1 || selectedtype==7)) {
      gridcolor[clickrow][clickcol]=2;
      if(clickrow>=2 && firstmove && selectedtype==1) gridcolor[clickrow-2][clickcol]=2;
      if(clickrow<=5 && firstmove && selectedtype==7) gridcolor[clickrow+2][clickcol]=2;
      if(clickrow>=1 && selectedtype==1) gridcolor[clickrow-1][clickcol]=2;
      if(clickrow<=6 && selectedtype==7) gridcolor[clickrow+1][clickcol]=2;
    }
    if (selected==false && (selectedtype==1)) {
      gridcolor[clickrow][clickcol]=prevcolor;
      if(clickrow>=2 && grid[clickrow-2][clickcol]==0) gridcolor[clickrow-2][clickcol]=prevcolor;
      if(clickrow>=1 && grid[clickrow-1][clickcol]==0) gridcolor[clickrow-1][clickcol]=1-prevcolor;
    }
    if (selected==false && (selectedtype==7)) {
      gridcolor[clickrow][clickcol]=prevcolor;
      if(clickrow<=5 && grid[clickrow+2][clickcol]==0) gridcolor[clickrow+2][clickcol]=prevcolor;
      if(clickrow<=6 && grid[clickrow+1][clickcol]==0) gridcolor[clickrow+1][clickcol]=1-prevcolor;
    }
  }
}
