boolean Check(boolean side, PImage[][] Board) {
  int i, j = 0;
  boolean b = false;

  for (i = 0; i<8; i++) {
    for (j = 0; j<8; j++) {
      if (side == WHITE) {
        if (Board[i][j] == wKing) { 
          b = true;
          break;
        }
      } else {
        if (Board[i][j] == bKing) { 
          b = true;
          break;
        }
      }
    }
    if (b == true) {
      break;
    }
  }
  for (int k = 0; k<8; k++) {
    for (int l = 0; l<8; l++) {
      if (side == WHITE) {
        if (notBlack(l, k, Board))
          continue;
      } else if (notWhite(l, k, Board)) {
        continue;
      }
      if (validMove(l, k, i, j, !side, Board)) return true;
    }
  }
  return false;
}
