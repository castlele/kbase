template<class Value>
class Node {
    public:
        Value value;
        Node *next;

        Node(Value, Node*);

        void print();
};
