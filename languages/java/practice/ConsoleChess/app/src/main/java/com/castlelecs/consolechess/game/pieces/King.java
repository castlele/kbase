package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class King extends ChessPiece {

    public King(Player player) {
        super(player);
    }

    @Override
    public String getSymbol() {
        return "K";
    }

    @Override
    public boolean canMoveToPosition(
        ChessBoard board,
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        if (isValidMove(startLine, startColumn, endLine, endColumn)) {
            return false;
        }

        int dx = Math.abs(endColumn - startColumn);
        int dy = Math.abs(endLine - startLine);

        return dx <= 1 && dy <= 1;
    }

    public boolean isUnderAttack(ChessBoard board, int line, int column) {
        return false;
    }
}
