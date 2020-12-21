#include <iostream>
#include <vector>
#include "stack.hpp"
int main()
{
    Stack<std::string> stk = Stack<std::string>();
    std::vector<std::string> items = {"a", "b", "c", "d", "e"};
    // Stack<int> stk = Stack<int>();
    // std::vector<int> items = {1, 2, 3, 4, 5};
    for (auto &&item : items)
    {
        stk.push(item);
        std::cout << stk.top() << " ";
    }
    std::cout << "\n";
    for (int i = 0; i < 10; i++)
    {
        std::cout << stk.pop() << " ";
    }
    std::cout << "\n"
              << stk.getSize();
}