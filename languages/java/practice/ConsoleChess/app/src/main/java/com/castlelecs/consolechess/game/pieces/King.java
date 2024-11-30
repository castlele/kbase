package com.castlelecs.consolechess.game.pieces;

import java.util.concurrent.atomic.AtomicReference;

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
        if (!isValidMove(board, startLine, startColumn, endLine, endColumn)) {
            return false;
        }

        int dx = Math.abs(endColumn - startColumn);
        int dy = Math.abs(endLine - startLine);

        return dx <= 1 && dy <= 1;
    }

    public boolean isUnderAttack(ChessBoard board, int line, int column) {
        Player enemy = getColor().toggle();
        AtomicReference<Boolean> isUnderAttackWrapper = new AtomicReference<>(false);

        board.getPiecesForPlayer(enemy, (piece, cell) -> {
            if (!isUnderAttackWrapper.get()) {
                isUnderAttackWrapper.set(
                    piece.canMoveToPosition(
                        board,
                        cell.getLine(),
                        cell.getColumn(),
                        line,
                        column
                    )
                );
            }
        });

        return isUnderAttackWrapper.get();
    }
}
