#if !defined(STACK)
#define STACK

template <typename T>
class Stack
{
private:
    size_t size = 0;
    size_t currSize = 0;
    size_t topIndex = -1;
    T *stackArr = nullptr;

public:
    Stack(int s)
    {
        size = s;
        stackArr = new T[size];
    };
    Stack()
    {
        size = 1000;
        stackArr = new T[size];
    };
    ~Stack()
    {
        delete[] stackArr;
    };

    void push(T elem)
    {
        if (currSize <= size)
        {
            stackArr[++topIndex] = elem;
            currSize++;
        }
    }

    T pop()
    {
        if (currSize > 0)
        {
            T item = stackArr[topIndex--];
            currSize--;
            return item;
        }
        return T();
    }
    T top()
    {
        if (currSize > 0)
        {
            return stackArr[topIndex];
        }
        return T();
    }
    int getSize()
    {
        return currSize;
    }
};

#endif // STACK
