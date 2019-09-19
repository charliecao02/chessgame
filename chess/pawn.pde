class Pawn extends Pieces{
  PVector location;
  Pawn(int _x, int _y, int _side){
    super();
    location.x=_x;
    location.y=_y;
    side=_side;
  }
  
  void show(){
    if(side==1){
      image(b_pawn,location.x*scale, location.y*scale);
    }
  }
  
  void act(){
    
  }
}
