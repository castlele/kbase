package org.example;

import java.io.File;

public class FileManager {

    public void openFile(String filePath) throws IllegalArgumentException {
        File f = new File(filePath);

        assertFileExists(f);
    }

    public File[] listFiles(String dirPath) throws IllegalArgumentException {
        File f = new File(dirPath);

        assertFileExists(f);

        if (!f.isDirectory()) {
            return new File[0];
        }

        return f.listFiles();
    }

    private void assertFileExists(File file) throws IllegalArgumentException {
        if (file.exists()) {
            return;
        }

        throw new IllegalArgumentException(
            "You've provided wrong file path: " + file.getPath() + ". This file doesn't exists!"
        );
    }
}
