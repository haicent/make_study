#include "xthread.hpp"
#include <iostream>

using namespace std;
void XThread::Start()
{
    cout << "start thread" << endl;
    th_ = thread(&XThread::Main, this);
}
void XThread::Wait()
{
    cout << "start wait thread" << endl;
    th_.join();
    cout << "end wait thread" << endl;
}
