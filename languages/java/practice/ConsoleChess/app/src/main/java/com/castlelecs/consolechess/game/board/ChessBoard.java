package com.castlelecs.consolechess.game.board;

import java.util.function.BiConsumer;
import java.util.function.Consumer;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.pieces.Bishop;
import com.castlelecs.consolechess.game.pieces.ChessPiece;
import com.castlelecs.consolechess.game.pieces.Horse;
import com.castlelecs.consolechess.game.pieces.King;
import com.castlelecs.consolechess.game.pieces.Pawn;
import com.castlelecs.consolechess.game.pieces.Queen;
import com.castlelecs.consolechess.game.pieces.Rook;

public class ChessBoard {

    private static char TAB = '\t';
    private static char NEW_LINE = '\n';

    public static int ROWS = 8;
    public static int COLUMNS = 8;

    private Player currentPlayer;
    private Player winner;

    public ChessPiece[][] board = new ChessPiece[ROWS][COLUMNS];

    public ChessBoard(Player currentPlayer) {
        this.currentPlayer = currentPlayer;
    }

    public void initializePieces() {
        board = new ChessPiece[ROWS][COLUMNS];
        winner = null;

        board[0][0] = new Rook(Player.WHITE);
        board[0][1] = new Horse(Player.WHITE);
        board[0][2] = new Bishop(Player.WHITE);
        board[0][3] = new Queen(Player.WHITE);
        board[0][4] = new King(Player.WHITE);
        board[0][5] = new Bishop(Player.WHITE);
        board[0][6] = new Horse(Player.WHITE);
        board[0][7] = new Rook(Player.WHITE);
        board[1][0] = new Pawn(Player.WHITE);
        board[1][1] = new Pawn(Player.WHITE);
        board[1][2] = new Pawn(Player.WHITE);
        board[1][3] = new Pawn(Player.WHITE);
        board[1][4] = new Pawn(Player.WHITE);
        board[1][5] = new Pawn(Player.WHITE);
        board[1][6] = new Pawn(Player.WHITE);
        board[1][7] = new Pawn(Player.WHITE);

        board[7][0] = new Rook(Player.BLACK);
        board[7][1] = new Horse(Player.BLACK);
        board[7][2] = new Bishop(Player.BLACK);
        board[7][3] = new Queen(Player.BLACK);
        board[7][4] = new King(Player.BLACK);
        board[7][5] = new Bishop(Player.BLACK);
        board[7][6] = new Horse(Player.BLACK);
        board[7][7] = new Rook(Player.BLACK);
        board[6][0] = new Pawn(Player.BLACK);
        board[6][1] = new Pawn(Player.BLACK);
        board[6][2] = new Pawn(Player.BLACK);
        board[6][3] = new Pawn(Player.BLACK);
        board[6][4] = new Pawn(Player.BLACK);
        board[6][5] = new Pawn(Player.BLACK);
        board[6][6] = new Pawn(Player.BLACK);
        board[6][7] = new Pawn(Player.BLACK);
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
            System.out.println("Start line is less than 0 or startColumn is greater than 7");
            return false;
        }

        ChessPiece movingPiece = board[startLine][startColumn];

        System.out.println("Moving piece is: " + movingPiece.getSymbol());

        if (!currentPlayer.equals(movingPiece.getColor())) {
            System.out.println("Got wrong player");
            return false;
        }

        if (!movingPiece.canMoveToPosition(this, startLine, startColumn, endLine, endColumn)) {
            System.out.println("Piece can't move to pos");
            return false;
        }

        King enenyKing = (King)board[endLine][endColumn];

        if (enenyKing != null) {
            winner = currentPlayer;
        }

        board[endLine][endColumn] = movingPiece;
        board[startLine][startColumn] = null;
        movingPiece.check = false;
        currentPlayer = currentPlayer.toggle();

        return true;
    }

    public Player getWinner() {
        return winner;
    }

    public boolean isGameOver() {
        return getWinner() != null;
    }

    public boolean castling0() {
        switch (currentPlayer) {
        case WHITE: return castling0(currentPlayer, 0);
        case BLACK: return castling0(currentPlayer, 7);
        default: return false;
        }
    }

    public boolean castling7() {
        switch (currentPlayer) {
        case WHITE: return castling7(currentPlayer, 0);
        case BLACK: return castling7(currentPlayer, 7);
        default: return false;
        }
    }

    public void getPiecesForPlayer(
        Player player,
        BiConsumer<ChessPiece, BoardCell> callback
    ) {
        for (int lineIndex = 0; lineIndex < ROWS; lineIndex++) {
            for (int columnIndex = 0; columnIndex < COLUMNS; columnIndex++) {
                ChessPiece piece = board[lineIndex][columnIndex];

                if (piece != null && piece.getColor().equals(player)) {
                    callback.accept(piece, new BoardCell(lineIndex, columnIndex));
                }
            }
        }
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
            builder.append(String.valueOf(i) + TAB);

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
            builder.append(NEW_LINE);
            builder.append(NEW_LINE);
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

    private boolean castling0(Player player, int line) {
        if (board[line][0] == null || board[line][4] == null) return false;

        Rook rook = (Rook)board[line][0];
        King king = (King)board[line][4];
        boolean isEmpty = board[line][1] == null && board[line][2] == null && board[line][3] == null;

        if (rook == null || king == null || isEmpty) return false;

        if (!rook.getColor().equals(player) || king.getColor().equals(player)) return false;
        if (!rook.check || !king.check || !king.isUnderAttack(this, line, 2)) return false;

        king.check = false;
        rook.check = false;

        board[line][4] = null;
        board[line][2] = king;

        board[line][0] = null;
        board[line][3] = rook;

        currentPlayer = currentPlayer.toggle();

        return true;
    }

    private boolean castling7(Player player, int line) {
        Rook rook = (Rook)board[line][7];
        King king = (King)board[line][4];
        boolean isEmpty = board[line][6] == null && board[line][5] == null;

        if (rook == null || king == null || isEmpty) return false;

        if (!rook.getColor().equals(player) || king.getColor().equals(player)) return false;
        if (!rook.check || !king.check || !king.isUnderAttack(this, line, 6)) return false;

        king.check = false;
        rook.check = false;

        board[line][4] = null;
        board[line][6] = king;

        board[line][7] = null;
        board[line][5] = rook;

        currentPlayer = currentPlayer.toggle();

        return true;
    }
}
