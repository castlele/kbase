#include <iostream>
#include "linked_list.h"

template<class Value>
Node<Value>::Node(Value value, Node* next) {
    this->value = value;
    this->next = next;
}

template<class Value>
void Node<Value>::print() {
    Node *current = this;

    while (current != NULL) {
        std::cout << current->value;

        current = current->next;

        if (current != NULL)
            printf(" -> ");
    }

    std::cout << std::endl;
}

int main()
{
    Node<int> third (3, NULL);
    Node<int> second (2, &third);
    Node<int> head (1, &second);

    Node<char> thirdChar ('C', NULL);
    Node<char> secondChar ('B', &thirdChar);
    Node<char> headChar ('A', &secondChar);

    head.print();
    headChar.print();
    return 0;
}
