#include <iostream>

using namespace std;

int main() {
  cout << "Hello, world!" << endl;
  int k = 1;
  for (int i = 2; i <= 10; ++i)
    k *= i;
  cout << k << endl;

  return 0;
}
