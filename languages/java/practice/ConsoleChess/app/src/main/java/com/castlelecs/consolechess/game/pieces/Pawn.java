package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class Pawn extends ChessPiece {

    public Pawn(Player player) {
        super(player);
    }

    @Override
    public String getSymbol() {
        return "P";
    }

    @Override
    public boolean canMoveToPosition(
        ChessBoard board,
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        if (!isValidMove(startLine, startColumn, endLine, endColumn)) {
            return false;
        }

        int dx = Math.abs(endColumn - startColumn);
        int dy = Math.abs(endLine - startLine);

        if (dx == 0) {
            return dy == 1 || (dy == 2 && isFirstMove(startLine));
        }

        return dx == 1 && dy == 1 && isAttack(board, endLine, endColumn);
    }

    private boolean isFirstMove(int startLine) {
        switch (getColor()) {
            case WHITE:
                return startLine == 1;
            case BLACK:
                return startLine == ChessBoard.ROWS - 1;
            default:
                return false;
        }
    }

    private boolean isAttack(
        ChessBoard board,
        int endLine,
        int endColumn
    ) {
        ChessPiece enemy = board.board[endLine][endColumn];

        return enemy != null;
    }
}
