package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class Horse extends ChessPiece {

    public Horse(Player player) {
        super(player);
    }

    @Override
    public String getSymbol() {
        return "H";
    }

    @Override
    public boolean canMoveToPosition(
        ChessBoard board,
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        if (!isValidMove(board, startLine, startColumn, endLine, endColumn)) {
            return false;
        }

        int dx = Math.abs(endColumn - startColumn);
        int dy = Math.abs(endLine - startLine);

        return isValidMoveShape(dx, dy);
    }

    private boolean isValidMoveShape(int dx, int dy) {
        return (dx == 2 && dy == 1) || (dx == 1 && dy == 2);
    }
}
