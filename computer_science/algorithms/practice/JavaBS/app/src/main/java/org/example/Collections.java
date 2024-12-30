package org.example;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;

public class Collections {

    public static <T> int binarySearch(Collection<? extends Comparable<? super T>> collection, T key) {
        return BinarySearch.binarySearch(new ArrayList<>(collection), key);
    }

    public static <T> int binarySearch(
        Collection<T> collection,
        T key,
        Comparator<T> comp
    ) {
        return BinarySearch.binarySearch(new ArrayList<>(collection), key, comp);
    }
}
