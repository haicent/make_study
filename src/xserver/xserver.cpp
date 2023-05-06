#include <iostream>
#include "xthread.hpp"
#include "xcom.hpp"

using namespace std;

class XTask : public XThread
{
public:
    void Main() override
    {
        cout << "ok" << endl;
    }
};

int main(int argc, char const *argv[])
{
    cout << "Xserver" << endl;
    XCom xcom;
    XTask xTask;
    xTask.Start();
    xTask.Wait();
    return 0;
}
