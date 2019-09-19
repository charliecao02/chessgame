int c=-1;
color black=#202020;
color white=#F0F0F0;
int scale=75;

PImage b_bishop, b_king, b_knight, b_pawn, b_queen, b_rook;
PImage w_bishop, w_king, w_knight, w_pawn, w_queen, w_rook;

ArrayList<Pieces> pieces;

void setup(){
 size(600,600);
 pieces= new ArrayList<Pieces>(100);
 for (int iy=0; iy<8; iy++) {
    c*=-1;
    for (int ix=0; ix<8; ix++) {
      if (c==1) fill(white);
      if (c==-1) fill(black);

      rect(ix*scale, iy*scale, scale, scale);
      c*=-1;
    }
  }
  
  b_bishop=loadImage("b_bishop.png");
  b_king=loadImage("b_king.png");
  b_knight=loadImage("b_knight.png");
  b_pawn=loadImage("b_pawn.png");
  b_queen=loadImage("b_queen.png");
  b_rook=loadImage("b_rook.png");
  w_bishop=loadImage("w_bishop.png");
  w_king=loadImage("w_king.png");
  w_knight=loadImage("w_knight.png");
  w_pawn=loadImage("w_pawn.png");
  w_queen=loadImage("w_queen.png");
  w_rook=loadImage("w_rook.png");
  
}

void draw(){
  pieces.add(new Pawn());//WTFffffffffffffffffffff
  for (int a=0; a<pieces.size(); a++) {
    Pieces currentPiece= pieces.get(a);
      currentPiece.show();
      currentPiece.act();
  }
}
