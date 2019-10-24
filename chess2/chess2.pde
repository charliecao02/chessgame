int down, right, down1, right1;//curr move, (down, right)starting pos   (down1,right1)ending pos
int p0, p1, p01, p11;//prev move, for en passant
boolean click;//first click select piece, second click moves piece
boolean WHITE = true;
boolean BLACK = false;
boolean turn;//player turn
boolean gameOver;
boolean wKingMoved, bKingMoved, wRookMoved1, bRookMoved1, wRookMoved2, bRookMoved2;//needed for castling
boolean check;//if in check
boolean promote;
PImage wKing, bKing, wQueen, bQueen, wPawn, bPawn, wRook, bRook, wKnight, bKnight, wBishop, bBishop;
PImage[][] board;

void setup() {
  size(640, 640);
  noStroke();
  textSize(width/8);
  textAlign(CENTER);

  wKing = loadImage("w_king.png");
  bKing = loadImage("b_king.png");
  wQueen = loadImage("w_queen.png");
  bQueen = loadImage("b_queen.png");
  wPawn = loadImage("w_pawn.png");
  bPawn = loadImage("b_pawn.png");
  wRook = loadImage("w_rook.png");
  bRook = loadImage("b_rook.png");
  wKnight = loadImage("w_knight.png");
  bKnight = loadImage("b_knight.png");
  wBishop = loadImage("w_bishop.png");
  bBishop = loadImage("b_bishop.png");
  startPosition();
}
void draw() {
  showBoard();
  if (gameOver) {
    fill(0, 255, 0);
    if (check) text("CHECKMATE", 0, height/2, width, height);
    else text("STALEMATE", 0, height/2, width, height);
  }
}
void showBoard() {
  for (int i = 0; i<8; i++)
    for (int j = 0; j<8; j++) { 
      if ((i+j)%2 == 0) fill(#F0F0F0);
      else fill(#202020);
      rect(i*width/8, j*height/8, width/8, height/8);//chessboard
      if (board[j][i] != null) image(board[j][i], i*width/8, j*height/8);//piece
      if (click) {
        if (validMove(down, right, j, i, turn, board) && !incheck(down, right, j, i, turn)) {
          fill(255, 215, 0, 100);//highlight posibble moves in red
          rect(i*width/8, j*height/8, width/8, height/8);
        }
        if (j == down && i == right && board[j][i] != null) {
          fill(255, 215, 0, 100);//highlight piece in blue
          rect(i*width/8, j*height/8, width/8, height/8);
        }
      }
    }
  if (check && !gameOver && !promote) {
    fill(0, 255, 0);
    text("CHECK", 0, height/2, width, height);
  }
  if (promote && !gameOver) {
    stroke(2);
    fill(200, 100);
    rect(0, 0, 2*width/8, height);
    rect(2*width/8, 0, 2*width/8, height);
    rect(4*width/8, 0, 2*width/8, height);
    rect(6*width/8, 0, 2*width/8, height);
    if (!turn) {
      image(wQueen, 0.5*width/8, 3.5*height/8);
      image(wRook, 2.5*width/8, 3.5*height/8);
      image(wBishop, 4.5*width/8, 3.5*height/8);
      image(wKnight, 6.5*width/8, 3.5*height/8);
    } else {
      image(bQueen, 0.5*width/8, 3.5*height/8);
      image(bRook, 2.5*width/8, 3.5*height/8);
      image(bBishop, 4.5*width/8, 3.5*height/8);
      image(bKnight, 6.5*width/8, 3.5*height/8);
    }
    noStroke();
  }
}
void mousePressed() {
  if (gameOver) startPosition();
  if (promote) {
    int x = round(mouseX/ (width/4)-0.5);
    if (!turn == WHITE) {
      if (x == 0) board[down1][right1] = wQueen;
      if (x == 1) board[down1][right1] = wRook;
      if (x == 2) board[down1][right1] = wBishop;
      if (x == 3) board[down1][right1] = wKnight;
    } else {
      if (x == 0) board[down1][right1] = bQueen;
      if (x == 1) board[down1][right1] = bRook;
      if (x == 2) board[down1][right1] = bBishop;
      if (x == 3) board[down1][right1] = bKnight;
    }
    promote = false;
    check = false;
    if (Check(turn, board)) {//king under attack
      check = true;
    }
    if (mate(turn)) {//no legal moves
      gameOver = true;
    }
  } else if (click) {
    down1 = round(mouseY / (height/8)-0.5);
    right1 = round(mouseX / (width/8)-0.5);
    if (validMove(down, right, down1, right1, turn, board) && !incheck(down, right, down1, right1, turn)) {
      check = false;//stop showing check
      board = movePiece(down, right, down1, right1, true, board);//move piece
      click = false;
    } else {//change piece
      down = down1;
      right = right1;
      click = true;
    }
  } else {
    down = round(mouseY / (height/8)-0.5);
    right = round(mouseX / (width/8)-0.5);
    click = true;
  }
}
void startPosition() {
  board = new PImage[8][8];

  board[0][0] = bRook;
  board[0][1] = bKnight;
  board[0][2] = bBishop;
  board[0][3] = bQueen;
  board[0][4] = bKing;
  board[0][5] = bBishop;
  board[0][6] = bKnight;
  board[0][7] = bRook;
  board[1][0] = bPawn;
  board[1][1] = bPawn;
  board[1][2] = bPawn; 
  board[1][3] = bPawn;
  board[1][4] = bPawn;
  board[1][5] = bPawn;
  board[1][6] = bPawn;
  board[1][7] = bPawn;

  board[7][0] = wRook;
  board[7][1] = wKnight;
  board[7][2] = wBishop;
  board[7][3] = wQueen;
  board[7][4] = wKing;
  board[7][5] = wBishop;
  board[7][6] = wKnight;
  board[7][7] = wRook;
  board[6][0] = wPawn;
  board[6][1] = wPawn;
  board[6][2] = wPawn;
  board[6][3] = wPawn;
  board[6][4] = wPawn;
  board[6][5] = wPawn;
  board[6][6] = wPawn;
  board[6][7] = wPawn;

  //global variables
  down=right=down1=right1=-1;
  p0=p1=p01=p11=-1;
  click = false;
  turn = WHITE;
  gameOver = false;
  wKingMoved = false;
  bKingMoved = false;
  wRookMoved1 = false;
  bRookMoved1 = false;
  wRookMoved2 = false;
  bRookMoved2 = false;
  check = false;
  promote = false;
}

boolean incheck(int down, int right, int down1, int right1, boolean side) {
  PImage[][] updateBoard = new PImage[8][8];
  for (int i = 0; i<8; i++)
    for (int j = 0; j<8; j++) 
      updateBoard[i][j] = board[i][j];
  updateBoard = movePiece(down, right, down1, right1, false, updateBoard);

  if (Check(side, updateBoard)) {
    return true;
  }
  return false;
}
boolean mate(boolean side) {//no valid moves
  for (int k = 0; k<8; k++) {
    for (int l = 0; l<8; l++) {
      if (side == WHITE) {
        if (notWhite(l, k, board))
          continue;
      } else if (notBlack(l, k, board)) {
        continue;
      }
      for (int i = 0; i<8; i++) {
        for (int j = 0; j<8; j++) {
          if (validMove(l, k, i, j, side, board) && !incheck(l, k, i, j, side)) return false;
        }
      }
    }
  }
  return true;
}

boolean possible(int down, int right, int down1, int right1, int d, int r, boolean side, PImage[][] Board) {
  for (int i = right + r, j  = down + d; i < 8 && j < 8 && i >= 0 && j >= 0; i+= r, j+= d) {
    if (side == WHITE) {
      if (white(j, i, Board)) break;//once diagon reaches white
      if (black(j, i, Board)) {//once diagon reaches black
        if (i == right1 && j == down1)return true;//kill first black
        break;
      }
    } else {
      if (black(j, i, Board)) break;//once direction reaches black
      if (white(j, i, Board)) {//once direction reaches white
        if (i == right1 && j == down1)return true;//kill first white
        break;
      }
    }
    if (i == right1 && j == down1)return true;//no piece
  }
  return false;
}
boolean black (int down1, int right1, PImage[][] Board) {
  return (Board[down1][right1] == bQueen || Board[down1][right1] == bKnight || Board[down1][right1] == bPawn || 
    Board[down1][right1] == bRook || Board[down1][right1] == bBishop || Board[down1][right1] == bKing);
}
boolean white (int down1, int right1, PImage[][] Board) {
  return (Board[down1][right1] == wQueen || Board[down1][right1] == wKnight || Board[down1][right1] == wPawn || 
    Board[down1][right1] == wRook || Board[down1][right1] == wBishop || Board[down1][right1] == wKing);
}
boolean notBlack (int down1, int right1, PImage[][] Board) {
  return (white(down1, right1, Board) || Board[down1][right1] ==null);
}
boolean notWhite (int down1, int right1, PImage[][] Board) {
  return (black(down1, right1, Board) || Board[down1][right1] ==null);
}
