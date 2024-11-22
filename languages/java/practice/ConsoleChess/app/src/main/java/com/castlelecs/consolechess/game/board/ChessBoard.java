package com.castlelecs.consolechess.game.board;

import com.castlelecs.consolechess.game.pieces.ChessPiece;
import com.castlelecs.consolechess.game.Player;

public class ChessBoard {

    private static int ROWS = 8;
    private static int COLUMNS = 8;

    private Player currentPlayer;

    public ChessPiece[][] board = new ChessPiece[ROWS][COLUMNS];

    public ChessBoard(Player currentPlayer) {
        this.currentPlayer = currentPlayer;
    }

    public Player getCurrentPlayer() {
        return currentPlayer;
    }

    public boolean moveToPosition(
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        if (!checkPosition(startLine, startColumn)) {
            return false;
        }

        ChessPiece movingPiece = board[startLine][startColumn];

        if (!currentPlayer.equals(movingPiece.getColor())) {
            return false;
        }

        if (!movingPiece.canMoveToPosition(this, startLine, startColumn, endLine, endColumn)) {
            return false;
        }

        board[endLine][endColumn] = movingPiece;
        board[startLine][startColumn] = null;

        currentPlayer = currentPlayer.toggle();
    }

    private boolean checkPosition(int rowPos, int columnPos) {
        return checkRowPosition(rowPos) && checkColumPosition(columnPos);
    }

    private boolean checkRowPosition(int pos) {
        return pos >= 0 && pos <= (ROWS - 1);
    }

    private boolean checkColumPosition(int pos) {
        return pos >= 0 && pos <= (COLUMNS - 1);
    }
}
