package com.castlelecs.consolechess.game.pieces;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class KingTests extends BaseTest {

    @Test
    void cantMoveToTheSamePos() {
        ChessBoard board = createBoard(null);
        King sut = new King(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 1));
    }

    @Test
    void cantMoveOutOfBounds() {
        ChessBoard board = createBoard(null);
        King sut = new King(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, -1, 1));
        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 8));
    }

    @Test
    void cantMoveToOccupiedByFriendCell() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][1] = new King(Player.WHITE);
        });
        King sut = new King(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void cantMoveLikeHorse() {
        ChessBoard board = createBoard(null);
        King sut = new King(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 0, 4, 3, 5));
    }

    @Test
    void canAnyCellAround() {
        ChessBoard board = createBoard((b) -> {
            b.board[3][3] = b.board[0][4];
            b.board[0][4] = null;
        });
        King sut = (King)board.board[3][3];

        assertTrue(sut.canMoveToPosition(board, 3, 3, 4, 3));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 4, 4));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 3, 4));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 2, 4));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 2, 3));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 2, 2));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 3, 2));
        assertTrue(sut.canMoveToPosition(board, 3, 3, 4, 2));
    }

    @Test
    void byDefaultIsNotUnderAttack() {
        ChessBoard board = createBoard(null);
        King sut = (King)board.board[0][4];

        assertFalse(sut.isUnderAttack(board, 0, 4));
    }
}

