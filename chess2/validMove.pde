boolean validMove(int down, int right, int down1, int right1, boolean side, PImage[][] Board) {
  if (side == WHITE) {//white
    if (Board[down][right] == wPawn && !promote) {
      if (right1 == right && down1 == down-1 && Board[down-1][right] == null) { // move forward 1
        return true;
      } else if (right1 == right && down1 == down-2) {// move forward 2
        if (down == 6 && Board[down-1][right] == null && Board[down-2][right] == null) {
          return true;
        }
      }
      if (right != 7) {//take
        if (black(down-1, right+1, Board)) {
          if (down1 == down-1 && right1 == right +1) return true;
        }
        if (down == 3 && Board[p01][p11] == bPawn && p01 == p0 + 2 && p1 == right + 1) {//en passant
          if (down1 == down-1 && right1 == right +1) return true;
        }
      }
      if (right != 0) {//take
        if (black(down-1, right-1, Board)) {
          if (down1 == down-1 && right1 == right -1) return true;
        }
        if (down == 3 && Board[p01][p11] == bPawn && p01 == p0 + 2 && p1 == right - 1) {//en passant
          if (down1 == down-1 && right1 == right - 1) return true;
        }
      }
    } else if (Board[down][right] == wKing) {
      if (abs(right - right1) <= 1 && abs(down - down1) <= 1) {//move
        if (notWhite(down1, right1, Board)) {
          return true;
        }
      }
      if (!wKingMoved && !check) {//castle
        if (Board[7][3] == null && Board[7][2] == null && Board[7][1] == null &&
          down1 == 7 && right1 == 2 && wRookMoved1 == false) {
          if (!incheck(down, right, 7, 3, turn)) {
            return true;
          }
        }
        if (Board[7][5] == null && Board[7][6] == null &&
          down1 == 7 && right1 == 6 && wRookMoved2 == false) {
          if (!incheck(down, right, 7, 5, turn)) {
            return true;
          }
        }
      }
    } else if (Board[down][right] == wKnight) {
      if ((abs(down1 - down) == 2 && abs(right1 - right) == 1) ||
        (abs(down1 - down) == 1 && abs(right1 - right) == 2)) {
        if (notWhite(down1, right1, Board)) return true;
      }
    } else if (Board[down][right] == wBishop) {      
      if (possible(down, right, down1, right1, 1, 1, WHITE, Board)) return true;//bottom right
      if (possible(down, right, down1, right1, 1, -1, WHITE, Board)) return true;//top right
      if (possible(down, right, down1, right1, -1, 1, WHITE, Board)) return true;//bottom left
      if (possible(down, right, down1, right1, -1, -1, WHITE, Board)) return true;//top left
    } else if (Board[down][right] == wRook) {
      if (possible(down, right, down1, right1, 0, 1, WHITE, Board)) return true;//right
      if (possible(down, right, down1, right1, 0, -1, WHITE, Board)) return true;//left
      if (possible(down, right, down1, right1, 1, 0, WHITE, Board)) return true;//down
      if (possible(down, right, down1, right1, -1, 0, WHITE, Board)) return true;//up
    } else if (Board[down][right] == wQueen) {
      if (possible(down, right, down1, right1, 1, 1, WHITE, Board)) return true;//bottom right
      if (possible(down, right, down1, right1, -1, 1, WHITE, Board)) return true;//top right
      if (possible(down, right, down1, right1, 1, -1, WHITE, Board)) return true;//bottom left
      if (possible(down, right, down1, right1, -1, -1, WHITE, Board)) return true;//top left
      if (possible(down, right, down1, right1, 0, 1, WHITE, Board)) return true;//right
      if (possible(down, right, down1, right1, 0, -1, WHITE, Board)) return true;//left
      if (possible(down, right, down1, right1, 1, 0, WHITE, Board)) return true;//down
      if (possible(down, right, down1, right1, -1, 0, WHITE, Board)) return true;//up
    }
  } else {
    if (Board[down][right] == bPawn && !promote) {
      if (right1 == right && down1 == down+1 && Board[down+1][right] == null) { // move forward 1
        return true;
      } else if (right1 == right && down1 == down+2) {// move forward 2
        if (down == 1 && Board[down+1][right] == null && Board[down+2][right] == null) {
          return true;
        }
      }
      if (right != 7) {//take
        if (white(down1, right1, Board)) {
          if (down1 == down+1 && right1 == right + 1) return true;
        }
        if (down == 4 && Board[p01][p11] == wPawn && p01 == p0 - 2 && p1 == right + 1) {//en passant
          if (down1 == down+1 && right1 == right + 1) return true;
        }
      }
      if (right != 0) {//take
        if (white(down1, right1, Board)) {
          if (down1 == down+1 && right1 == right - 1) return true;
        }
        if (down == 4 && Board[p01][p11] == wPawn && p01 == p0 - 2 && p1 == right - 1) {//en pasant
          if (down1 == down+1 && right1 == right - 1) return true;
        }
      }
    } else if (Board[down][right] == bKing) {
      if (abs(right - right1) <= 1 && abs(down - down1) <= 1) {
        if (notBlack(down1, right1, Board)) {
          return true;
        }
      }
      if (!bKingMoved && !check) {
        if (Board[0][3] == null && Board[0][2] == null && Board[0][1] == null &&
          Board[0][0] == bRook && down1 == 0 && right1 == 2) {
          if (!incheck(down, right, 0, 3, turn)) {
            return true;
          }
        }
        if (Board[0][5] == null && Board[0][6] == null &&
          Board[0][7] == bRook && down1 == 0 && right1 == 6) {
          if (!incheck(down, right, 0, 5, turn)) {
            return true;
          }
        }
      }
    } else if (Board[down][right] == bKnight) {
      if ((abs(down1 - down) == 2 && abs(right1 - right) == 1) ||
        (abs(down1 - down) == 1 && abs(right1 - right) == 2)) {
        if (notBlack(down1, right1, Board)) return true;
      }
    } else if (Board[down][right] == bBishop) {     
      if (possible(down, right, down1, right1, 1, 1, BLACK, Board)) return true;//bottom right
      if (possible(down, right, down1, right1, 1, -1, BLACK, Board)) return true;//top right
      if (possible(down, right, down1, right1, -1, 1, BLACK, Board)) return true;//bottom left
      if (possible(down, right, down1, right1, -1, -1, BLACK, Board)) return true;//top left
    } else if (Board[down][right] == bRook) {
      if (possible(down, right, down1, right1, 0, 1, BLACK, Board)) return true;//right
      if (possible(down, right, down1, right1, 0, -1, BLACK, Board)) return true;//left
      if (possible(down, right, down1, right1, 1, 0, BLACK, Board)) return true;//down
      if (possible(down, right, down1, right1, -1, 0, BLACK, Board)) return true;//up
    } else if (Board[down][right] == bQueen) {
      if (possible(down, right, down1, right1, 1, 1, BLACK, Board)) return true;//bottom right
      if (possible(down, right, down1, right1, -1, 1, BLACK, Board)) return true;//top right
      if (possible(down, right, down1, right1, 1, -1, BLACK, Board)) return true;//bottom left
      if (possible(down, right, down1, right1, -1, -1, BLACK, Board)) return true;//top left
      if (possible(down, right, down1, right1, 0, 1, BLACK, Board)) return true;//right
      if (possible(down, right, down1, right1, 0, -1, BLACK, Board)) return true;//left
      if (possible(down, right, down1, right1, 1, 0, BLACK, Board)) return true;//down
      if (possible(down, right, down1, right1, -1, 0, BLACK, Board)) return true;//up
    }
  }
  return false;
}
