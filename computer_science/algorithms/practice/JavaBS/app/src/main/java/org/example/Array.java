package org.example;

import java.util.Comparator;
import java.util.List;

public class Array {

    public static int binarySearch(byte[] a, byte key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(byte[] a, int fromIndex, int toIndex, byte key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static int binarySearch(char[] a, char key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(char[] a, int fromIndex, int toIndex, char key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static int binarySearch(double[] a, double key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(double[] a, int fromIndex, int toIndex, double key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static int binarySearch(float[] a, float key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(float[] a, int fromIndex, int toIndex, float key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static int binarySearch(int[] a, int key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(int[] a, int fromIndex, int toIndex, int key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static int binarySearch(long[] a, long key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(long[] a, int fromIndex, int toIndex, long key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static int binarySearch(short[] a, short key) {
        return BinarySearch.binarySearch(a, 0, a.length - 1, key);
    }

    public static int binarySearch(short[] a, int fromIndex, int toIndex, short key) {
        return BinarySearch.binarySearch(a, fromIndex, toIndex, key);
    }

    public static <T> int binarySearch(List<? extends Comparable<? super T>> list, T key) {
        return BinarySearch.binarySearch(list, key);
    }

    public static <T> int binarySearch(
        List<T> list,
        T key,
        Comparator<T> comp
    ) {
        return BinarySearch.binarySearch(list, key, comp);
    }
}
