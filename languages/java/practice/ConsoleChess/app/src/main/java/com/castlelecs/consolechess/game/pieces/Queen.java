package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class Queen extends ChessPiece {

    public Queen(Player player) {
        super(player);
    }

    @Override
    public String getSymbol() {
        return "Q";
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

        boolean isStraight = dy == 0 && dx >= 1 || dx == 0 && dy >= 1;
        boolean isDiagonally = dx == dy;

        return isStraight || isDiagonally;
    }
}
