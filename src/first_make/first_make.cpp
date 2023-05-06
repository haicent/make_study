#include <iostream>
#include <thread>
#include "xdata.hpp"
#include "test.hpp"

using namespace std;

void ThreadMain()
{
    cout << "Thread Main" << endl;
}

int main(int argc, char const *argv[])
{
    thread th(ThreadMain);
    cout << "test make" << endl;
    th.join();
    XData d;
    return 0;
}
