package com.castlelecs.consolechess.game.pieces;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class PawnTests extends BaseTest {

    @Test
    void cantMoveToTheSamePos() {
        ChessBoard board = createBoard(null);
        Pawn sut = new Pawn(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 1));
    }

    @Test
    void cantMoveOutOfBounds() {
        ChessBoard board = createBoard(null);
        Pawn sut = new Pawn(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, -1, 1));
        assertFalse(sut.canMoveToPosition(board, 1, 1, 1, 8));
    }

    @Test
    void cantMoveToOccupiedByFriendCell() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][1] = new Pawn(Player.WHITE);
        });
        Pawn sut = new Pawn(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void canMoveForwardBy1() {
        ChessBoard board = createBoard(null);
        Pawn sut = new Pawn(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 1, 1, 2, 1));
    }

    @Test
    void canMoveForwardBy2IfFirstMove() {
        ChessBoard board = createBoard(null);
        Pawn sut = new Pawn(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 1, 1, 3, 1));
    }

    @Test
    void cantMoveForwardBy2IfNotFirstMove() {
        ChessBoard board = createBoard((b) -> {
            b.moveToPosition(1, 1, 3, 1);
        });
        Pawn sut = new Pawn(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 3, 1, 5, 1));
        assertTrue(sut.canMoveToPosition(board, 3, 1, 4, 1));
    }

    @Test
    void cantMoveDiagonallyWithougAttack() {
        ChessBoard board = createBoard(null);
        Pawn sut = new Pawn(Player.WHITE);

        assertFalse(sut.canMoveToPosition(board, 1, 1, 2, 2));
    }

    @Test
    void canMoveDiagonallyWithAttack() {
        ChessBoard board = createBoard((b) -> {
            b.board[2][2] = new Pawn(Player.BLACK);
        });
        Pawn sut = new Pawn(Player.WHITE);

        assertTrue(sut.canMoveToPosition(board, 1, 1, 2, 2));
    }
}
