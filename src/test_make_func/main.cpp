#include <iostream>
#include "xdata.h"
using namespace std;
int main(int argc,char *argv[])
{

	extern void Test();
	Test();
	XData d;
	cout << "hello func" <<endl;
	return 0;
}
