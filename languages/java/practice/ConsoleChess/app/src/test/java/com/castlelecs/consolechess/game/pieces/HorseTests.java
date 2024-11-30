package com.castlelecs.consolechess.game.pieces;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class HorseTests extends BaseTest {

    @Test
    void cantMoveToTheSamePos() {
        ChessBoard board = createBoard(null);
        Horse sut = new Horse(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 1));
    }

    @Test
    void cantMoveOutOfBounds() {
        ChessBoard board = createBoard(null);
        Horse sut = new Horse(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, -1, 1));
        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 8));
    }

    @Test
    void cantMoveToOccupiedByFriendCell() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][1] = new Horse(Player.WHITE);
        });
        Horse sut = new Horse(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void canMoveRight() {
        ChessBoard board = createBoard(null);
        Horse sut = new Horse(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 1, 2, 2));
    }

    @Test
    void canMoveLeft() {
        ChessBoard board = createBoard(null);
        Horse sut = new Horse(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 0, 1, 2, 0));
    }

    @Test
    void cantMoveForward() {
        ChessBoard board = createBoard(null);
        Horse sut = new Horse(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 0, 1, 4, 1));
    }

    @Test
    void cantEatKingByDefault() {
        ChessBoard board = createBoard(null);
        Horse sut = (Horse)board.board[7][6];

        assertFalse(sut.canMoveToPosition(board, 7, 6, 0, 4));
    }
}

