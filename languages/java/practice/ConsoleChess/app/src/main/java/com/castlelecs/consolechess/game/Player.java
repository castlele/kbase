package com.castlelecs.consolechess.game;

public enum Player {
    WHITE,
    BLACK;

    public Player toggle() {
        switch (this) {
            case WHITE: return Player.BLACK;
            case BLACK: return Player.WHITE;
            default: return null;
        }
    }
}
