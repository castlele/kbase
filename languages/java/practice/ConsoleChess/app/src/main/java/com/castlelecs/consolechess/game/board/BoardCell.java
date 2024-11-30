package com.castlelecs.consolechess.game.board;

public class BoardCell {

    private int line;
    private int column;

    public BoardCell(int line, int column) {
        this.line = line;
        this.column = column;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }
}
