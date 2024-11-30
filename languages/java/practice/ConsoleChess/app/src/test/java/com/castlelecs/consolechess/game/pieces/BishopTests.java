package com.castlelecs.consolechess.game.pieces;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class BishopTests extends BaseTest {

    @Test
    void cantMoveToTheSamePos() {
        ChessBoard board = createBoard(null);
        Bishop sut = new Bishop(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 1));
    }

    @Test
    void cantMoveOutOfBounds() {
        ChessBoard board = createBoard(null);
        Bishop sut = new Bishop(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, -1, 1));
        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 8));
    }

    @Test
    void cantMoveToOccupiedByFriendCell() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][1] = new Bishop(Player.WHITE);
        });
        Bishop sut = new Bishop(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void canMoveLikeHorse() {
        ChessBoard board = createBoard(null);
        Bishop sut = new Bishop(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 0, 2, 3, 3));
    }

    @Test
    void cantMoveForward() {
        ChessBoard board = createBoard(null);
        Bishop sut = new Bishop(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 0, 2, 4, 2));
    }

    @Test
    void canMoveDiagonallyLeft() {
        ChessBoard board = createBoard(null);
        Bishop sut = new Bishop(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 2, 2, 0));
    }

    @Test
    void canMoveDiagonallyRight() {
        ChessBoard board = createBoard(null);
        Bishop sut = new Bishop(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 2, 5, 7));
        assertTrue(sut.canMoveToPosition(board, 0, 2, 4, 6));
    }
}

