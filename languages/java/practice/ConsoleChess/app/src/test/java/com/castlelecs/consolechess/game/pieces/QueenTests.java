package com.castlelecs.consolechess.game.pieces;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class QueenTests extends BaseTest {

    @Test
    void cantMoveToTheSamePos() {
        ChessBoard board = createBoard(null);
        Queen sut = new Queen(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 1));
    }

    @Test
    void cantMoveOutOfBounds() {
        ChessBoard board = createBoard(null);
        Queen sut = new Queen(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, -1, 1));
        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 8));
    }

    @Test
    void cantMoveToOccupiedByFriendCell() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][1] = new Queen(Player.WHITE);
        });
        Queen sut = new Queen(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void cantMoveLikeHorse() {
        ChessBoard board = createBoard(null);
        Queen sut = new Queen(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 0, 3, 3, 4));
    }

    @Test
    void canMoveDiagonallyLeft() {
        ChessBoard board = createBoard(null);
        Queen sut = new Queen(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 3, 2, 1));
    }

    @Test
    void canMoveDiagonallyRight() {
        ChessBoard board = createBoard(null);
        Queen sut = new Queen(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 2, 3, 2, 5));
    }

    @Test
    void canMoveForward() {
        ChessBoard board = createBoard(null);
        Queen sut = new Queen(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 3, 4, 3));
    }
}

