PImage[][] movePiece(int i0, int j0, int i1, int j1, boolean update, PImage[][] Board) {
  if (update) {
    p0 = i0; 
    p1 = j1; 
    p01 = i1; 
    p11 = j1;//setup prev move for en passant
  }
  if (Board[i0][j0] == wPawn) {
    if (i1 == 0) {
      if (update) promote = true;
    } else if (i1 == 2 && abs(j1 - j0) == 1 && Board[i1][j1] == null) {//en passant
      Board[i1 + 1][j1] = null;
    }
  } else if (Board[i0][j0] == bPawn) {//promote black pawn
    if (i1 == 7) {
      if (update) promote = true;
    } else if (i1 == 5 && abs(j1 - j0) == 1 && Board[i1][j1] == null) {//en passant
      Board[i1 - 1][j1] = null;
    }
  } else if (Board[i0][j0] == wKing) {
    if (wKingMoved == false && j1 == 2) {//castle
      Board[7][0] = null;
      Board[7][3] = wRook;
    }
    if (wKingMoved == false && j1 == 6) {//castle
      Board[7][7] = null;
      Board[7][5] = wRook;
    }
    if (update)wKingMoved = true;
  } else if (Board[i0][j0] == bKing) {
    if (bKingMoved == false && j1 == 2) {
      Board[0][0] = null;
      Board[0][3] = bRook;
    }
    if (bKingMoved == false && j1 == 6) {
      Board[0][7] = null;
      Board[0][5] = bRook;
    }
    if (update)bKingMoved = true;
  } else if (Board[i0][j0] == wRook) {
    if (update) {
      if (!wRookMoved1 && j0 == 0) wRookMoved1 = true;
      if (!wRookMoved2 && j0 == 7) wRookMoved2 = true;
    }
  } else if (Board[i0][j0] == bRook) {
    if (update) {
      if (!bRookMoved1 && j0 == 0) bRookMoved1 = true;
      if (!bRookMoved2 && j0 == 7) bRookMoved2 = true;
    }
  }
  Board[i1][j1] = Board[i0][j0];//move piece
  Board[i0][j0] = null;//remove original piece

  if (update) {
    if (Check(!turn, Board)) {//king under attack
      check = true;
    }
    if (mate(!turn)) {//no legal moves
      gameOver = true;
    }
    turn = !turn;
  }
  return Board;
}
