package com.castlelecs.consolechess.game.board;

import com.castlelecs.consolechess.game.pieces.ChessPiece;
import com.castlelecs.consolechess.game.Player;

public class ChessBoard {

    private static char TAB = '\t';
    private static char NEW_LINE = '\n';

    public static int ROWS = 8;
    public static int COLUMNS = 8;

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

        return true;
    }

    public boolean castling0() {
        return false;
    }

    public boolean castling7() {
        return false;
    }

    public void printBoard() {
        System.out.println(this);
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        builder
            .append("Turn " + currentPlayer)
            .append(NEW_LINE)
            .append("\t0\t1\t2\t3\t4\t5\t6\t7")
            .append(NEW_LINE);

        for (int i = ROWS - 1; i > -1; i--) {
            builder.append(i + TAB);

            for (int j = 0; j < COLUMNS; j++) {
                ChessPiece peice = board[i][j];

                if (peice == null) {
                    builder.append(".." + TAB);
                } else {
                    String colorValue = peice
                        .getColor()
                        .name()
                        .substring(0, 1)
                        .toLowerCase();

                    builder.append(peice.getSymbol() + colorValue + TAB);
                }
            }
        }

        return builder.toString();
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
