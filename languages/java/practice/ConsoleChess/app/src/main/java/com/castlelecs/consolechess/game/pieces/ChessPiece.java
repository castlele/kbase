package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public abstract class ChessPiece {

    private Player player;
    private Boolean check = true;

    public Player getColor() {
        return player;
    }

    public ChessPiece(Player player) {
        this.player = player;
    }

    public abstract String getSymbol();

    public abstract boolean canMoveToPosition(
        ChessBoard board,
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    );

    protected boolean isValidMove(
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        boolean isMoveOutOfBoard = isMoveOutOfBoard(
            startLine,
            startColumn,
            endLine,
            endColumn
        );
        boolean isMoveToTheSamePosition = isMoveToTheSamePosition(
            startLine,
            startColumn,
            endLine,
            endColumn
        );

        return !isMoveOutOfBoard && !isMoveToTheSamePosition;
    }

    protected boolean isMoveOutOfBoard(
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        int maxLines = ChessBoard.ROWS;
        int maxColumns = ChessBoard.COLUMNS;

        return startLine >= 0 && startColumn >= 0 && endLine < maxLines && endColumn < maxColumns;
    }

    protected boolean isMoveToTheSamePosition(
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        return startLine == endLine && startColumn == endColumn;
    }
}
