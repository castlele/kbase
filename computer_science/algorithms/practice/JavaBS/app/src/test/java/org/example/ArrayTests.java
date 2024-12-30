package org.example;

import static org.junit.Assert.*;

import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;

import org.example.mocks.Pet;
import org.junit.Test;

public class ArrayTests {

    @Test
    public void binarySearchInByteArrayWithKey() {
        byte arr[] = { 0, 1, 2, 4, 5, 6 };
        byte key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInByteArrayWithKeyInBounds() {
        byte arr[] = { 0, 1, 2, 4, 5, 6 };
        byte key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInCharArrayWithKey() {
        char arr[] = { 0, 1, 2, 4, 5, 6 };
        char key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInCharArrayWithKeyInBounds() {
        char arr[] = { 0, 1, 2, 4, 5, 6 };
        char key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInDoubleArrayWithKey() {
        double arr[] = { 0, 1, 2, 4, 5, 6 };
        double key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInDoubleArrayWithKeyInBounds() {
        double arr[] = { 0, 1, 2, 4, 5, 6 };
        double key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInFloatArrayWithKey() {
        float arr[] = { 0, 1, 2, 4, 5, 6 };
        float key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInFloatArrayWithKeyInBounds() {
        float arr[] = { 0, 1, 2, 4, 5, 6 };
        float key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInIntArrayWithKey() {
        int arr[] = { 0, 1, 2, 4, 5, 6 };
        int key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInIntArrayWithKeyInBounds() {
        int arr[] = { 0, 1, 2, 4, 5, 6 };
        int key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInLongArrayWithKey() {
        long arr[] = { 0, 1, 2, 4, 5, 6 };
        long key = 5;
        int expectedIndex = 4;

        long result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInLongInBounds() {
        long arr[] = { 0, 1, 2, 4, 5, 6 };
        long key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInShortArrayWithKey() {
        short arr[] = { 0, 1, 2, 4, 5, 6 };
        short key = 5;
        int expectedIndex = 4;

        long result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInShortInBounds() {
        short arr[] = { 0, 1, 2, 4, 5, 6 };
        short key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, 2, 4, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInGenericListWithKey() {
        List<Integer> arr = new ArrayList<>();
        arr.add(0);
        arr.add(1);
        arr.add(2);
        arr.add(4);
        arr.add(5);
        arr.add(6);
        Integer key = 5;
        int expectedIndex = 4;

        int result = Array.binarySearch(arr, key);

        assertEquals(expectedIndex, result);
    }

    @Test
    public void binarySearchInGenericListWithCustomComparator() {
        List<Pet> arr = new ArrayList<>();
        Pet key = new Pet("Perry", 12);
        arr.add(new Pet("Javie", 1));
        arr.add(new Pet("Puh", 2));
        arr.add(new Pet("Shanty", 10));
        arr.add(key);
        arr.add(new Pet("Misha", 18));
        int expectedIndex = 3;

        int result = Array.binarySearch(arr, key, new Comparator<Pet>() {
            @Override
            public int compare(Pet o1, Pet o2) {
                int comp = 0;
                int o1Age = o1.age;
                int o2Age = o2.age;

                if (o1Age > o2Age) {
                    comp = 1;
                } else if (o1Age < o2Age) {
                    comp = -1;
                }

                return comp;
            }
        });

        assertEquals(expectedIndex, result);
    }
}
