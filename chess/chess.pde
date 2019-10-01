int c=-1;
color black=#202020;
color white=#F0F0F0;
color gold=color(255, 215, 0);
int scale=75;
int clickrow, clickcol, selectedtype;
int prevclickrow, prevclickcol;
boolean selected=false;

int[][] grid = {
  //0=empty
  {8, 9, 10, 11, 12, 10, 9, 8}, 
  {7, 7, 7, 7, 7, 7, 7, 7}, 
  {0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0}, 
  {1, 1, 1, 1, 1, 1, 1, 1}, 
  {2, 3, 4, 5, 6, 4, 3, 2}
};

int[][] gridcolor = {
  //0=white, 1=black, 2=gold
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}
};

PImage b_bishop, b_king, b_knight, b_pawn, b_queen, b_rook;
PImage w_bishop, w_king, w_knight, w_pawn, w_queen, w_rook;

ArrayList<Pieces> pieces;

void setup() {
  size(600, 600);
  imageMode(CENTER);
  pieces= new ArrayList<Pieces>(100);
  for (int iy=0; iy<8; iy++) {
    for (int ix=0; ix<8; ix++) {
      if (gridcolor[iy][ix]==0) {
        fill(white);
        rect(ix*scale, iy*scale, scale, scale);
      }
      if (gridcolor[iy][ix]==1) {
        fill(black);
        rect(ix*scale, iy*scale, scale, scale);
      }
      if (gridcolor[iy][ix]==2) {
        fill(gold);
        rect(ix*scale, iy*scale, scale, scale);
      }
    }
  }
  
  for (int iy=0; iy<8; iy++) {
    for (int ix=0; ix<8; ix++) {
      if (grid[iy][ix]==1) pieces.add(new Pawn(ix,iy,0));
      if (grid[iy][ix]==2) pieces.add(new Rook(ix,iy,0));
      if (grid[iy][ix]==3) pieces.add(new Knight(ix,iy,0));
      if (grid[iy][ix]==4) pieces.add(new Bishop(ix,iy,0));
      if (grid[iy][ix]==5) pieces.add(new Queen(ix,iy,0));
      if (grid[iy][ix]==6) pieces.add(new King(ix,iy,0));
      if (grid[iy][ix]==7) pieces.add(new Pawn(ix,iy,1));
      if (grid[iy][ix]==8) pieces.add(new Rook(ix,iy,1));
      if (grid[iy][ix]==9) pieces.add(new Knight(ix,iy,1));
      if (grid[iy][ix]==10) pieces.add(new Bishop(ix,iy,1));
      if (grid[iy][ix]==11) pieces.add(new Queen(ix,iy,1));
      if (grid[iy][ix]==12) pieces.add(new King(ix,iy,1));
    }
  }

  w_pawn=loadImage("w_pawn.png");//1
  w_rook=loadImage("w_rook.png");//2
  w_knight=loadImage("w_knight.png");//3
  w_bishop=loadImage("w_bishop.png");//4
  w_queen=loadImage("w_queen.png");//5
  w_king=loadImage("w_king.png");//6

  b_pawn=loadImage("b_pawn.png");//7
  b_rook=loadImage("b_rook.png");//8
  b_knight=loadImage("b_knight.png");//9
  b_bishop=loadImage("b_bishop.png");//10
  b_queen=loadImage("b_queen.png");//11
  b_king=loadImage("b_king.png");//12
}

void draw() {
  for (int iy=0; iy<8; iy++) {
    for (int ix=0; ix<8; ix++) {
      if (gridcolor[iy][ix]==0) {
        fill(white);
        rect(ix*scale, iy*scale, scale, scale);
      }
      if (gridcolor[iy][ix]==1) {
        fill(black);
        rect(ix*scale, iy*scale, scale, scale);
      }
      if (gridcolor[iy][ix]==2) {
        fill(gold);
        rect(ix*scale, iy*scale, scale, scale);
      }
    }
  }

  for (int a=0; a<pieces.size(); a++) {
    Pieces currentPiece= pieces.get(a);
    currentPiece.show();
    currentPiece.act();
  }
}
