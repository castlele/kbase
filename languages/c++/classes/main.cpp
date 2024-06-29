#include <iostream>

struct Data {
    int value;
    Data(int value) { this->value = value; }
};

class Printer {
    public:
        Printer() {}

        template<typename T>
        void printValue(T value) {
            std::cout << value << std::endl;
        }
};

template<class T>
void printClass(T value) {
    std::cout << value << std::endl;
}

int main() {
    Data data (12);
    Printer printer;

    printer.printValue(data.value);
    printClass(data.value);
    
    return 0;
}
