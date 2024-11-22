package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class ChessPiece {

    private Player color;

    public Player getColor() {
        return color;
    }

    public boolean canMoveToPosition(
        ChessBoard board,
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        return false;
    }
}
