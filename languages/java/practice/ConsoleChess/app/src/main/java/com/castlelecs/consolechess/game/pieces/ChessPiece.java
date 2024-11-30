package com.castlelecs.consolechess.game.pieces;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public abstract class ChessPiece {

    private Player player;
    public Boolean check = true;

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
        ChessBoard board,
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        if (isMoveOutOfBoard(endLine, endColumn)) {
            return false;
        }

        boolean isMoveToTheSamePosition = isMoveToTheSamePosition(
            startLine,
            startColumn,
            endLine,
            endColumn
        );
        boolean isOccupiedByFriendlyPiece = isOccupiedByFriendlyPiece(
            board,
            endLine,
            endColumn
        );

        return !isMoveToTheSamePosition && !isOccupiedByFriendlyPiece;
    }

    protected boolean isMoveOutOfBoard(
        int endLine,
        int endColumn
    ) {
        int maxLines = ChessBoard.ROWS;
        int maxColumns = ChessBoard.COLUMNS;

        return endLine >= maxLines
            || endColumn >= maxColumns
            || endLine < 0
            || endColumn < 0;
    }

    protected boolean isMoveToTheSamePosition(
        int startLine,
        int startColumn,
        int endLine,
        int endColumn
    ) {
        return startLine == endLine && startColumn == endColumn;
    }

    protected boolean isOccupiedByFriendlyPiece(
        ChessBoard board,
        int endLine,
        int endColumn
    ) {
        ChessPiece piece = board.board[endLine][endColumn];

        return piece != null && piece.getColor() == getColor();
    }
}
