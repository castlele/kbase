package com.castlelecs.consolechess.game.pieces;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class RookTests extends BaseTest {

    @Test
    void cantMoveToTheSamePos() {
        ChessBoard board = createBoard(null);
        Rook sut = new Rook(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 1));
    }

    @Test
    void cantMoveOutOfBounds() {
        ChessBoard board = createBoard(null);
        Rook sut = new Rook(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, -1, 1));
        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 8));
    }

    @Test
    void cantMoveToOccupiedByFriendCell() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][1] = new Rook(Player.WHITE);
        });
        Rook sut = new Rook(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void cantMoveLikeHorse() {
        ChessBoard board = createBoard(null);
        Rook sut = new Rook(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 0, 0, 3, 3));
    }

    @Test
    void cantMoveDiagonallyLeft() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][3] = b.board[0][0];
            b.board[0][0] = null;
        });
        Rook sut = (Rook)board.board[2][3];

        assertFalse(sut.canMoveToPosition(board, 2, 3, 4, 1));
    }

    @Test
    void cantMoveDiagonallyRight() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][3] = b.board[0][0];
            b.board[0][0] = null;
        });
        Rook sut = (Rook)board.board[2][3];

        assertFalse(sut.canMoveToPosition(board, 2, 3, 5, 6));
    }

    @Test
    void canMoveForward() {
        ChessBoard board = createBoard(null);
        Rook sut = new Rook(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 0, 3, 0));
    }

    @Test
    void leftRookCantEatKingByDefault() {
        ChessBoard board = createBoard(null);
        Rook sut = (Rook)board.board[0][7];

        assertFalse(sut.canMoveToPosition(board, 7, 0, 0, 4));
    }

    @Test
    void rightRookCantEatKingByDefault() {
        ChessBoard board = createBoard(null);
        Rook sut = (Rook)board.board[7][7];

        assertFalse(sut.canMoveToPosition(board, 7, 7, 0, 4));
    }
}
