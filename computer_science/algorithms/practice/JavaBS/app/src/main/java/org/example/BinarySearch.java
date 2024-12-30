package org.example;

import java.util.Comparator;
import java.util.List;

class BinarySearch {
    static int binarySearch(byte[] a, int fromIndex, int toIndex, byte key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            byte value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static int binarySearch(char[] a, int fromIndex, int toIndex, char key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            char value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static int binarySearch(double[] a, int fromIndex, int toIndex, double key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            double value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static int binarySearch(float[] a, int fromIndex, int toIndex, float key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            float value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static int binarySearch(int[] a, int fromIndex, int toIndex, int key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            int value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static int binarySearch(long[] a, int fromIndex, int toIndex, long key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            long value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static int binarySearch(short[] a, int fromIndex, int toIndex, short key) {
        int low = fromIndex;
        int high = toIndex;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            short value = a[mid];

            if (value == key) {
                return mid;
            } else if (value < key) {
                low = mid + 1;
            } else if (value > key) {
                high = mid - 1;
            }
        }

        return -1;
    }

    static <T> int binarySearch(List<? extends Comparable<? super T>> list, T key) {
        int low = 0;
        int high = list.size() - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            Comparable<? super T> value = list.get(mid);
            int cmp = value.compareTo(key);

            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return mid;
            }
        }

        return -1;
    }

    static <T> int binarySearch(
        List<T> list,
        T key,
        Comparator<T> comp
    ) {
        int low = 0;
        int high = list.size() - 1;

        while (low <= high) {
            int mid = low + (high - low) / 2;
            int cmp = comp.compare(list.get(mid), key);

            if (cmp < 0) {
                low = mid + 1;
            } else if (cmp > 0) {
                high = mid - 1;
            } else {
                return mid;
            }
        }

        return -1;
    }
}

