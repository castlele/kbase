package com.castlelecs.consolechess.game.pieces;

import java.util.function.Consumer;

import com.castlelecs.consolechess.game.Player;
import com.castlelecs.consolechess.game.board.ChessBoard;

public class BaseTest {

    protected ChessBoard createBoard(Consumer<ChessBoard> callback) {
        ChessBoard board = new ChessBoard(Player.WHITE);
        board.initializePieces();

        if (callback != null) {
            callback.accept(board);
        }

        return board;
    }
}
