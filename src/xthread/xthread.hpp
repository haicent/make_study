#pragma once
#include <thread>

class XThread
{
public:
    virtual void Start();
    virtual void Wait();

private:
    virtual void Main(){};
    std::thread th_;
};
