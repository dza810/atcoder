// Contest ID: abc246
// Problem ID: abc246_b ( https://atcoder.jp/contests/abc246/tasks/abc246_b )
// Title: B. Get Closer
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-04 09:01:12 +0000 UTC ( https://atcoder.jp/contests/abc246/submissions/30718800 ) 

#include<iostream>
#include<vector>
#include<cmath>

using namespace std;

int main(){
  int a, b;
  cin >> a >> b;
  double out = sqrt((double)(a * a + b * b));
  cout << (double)a / out << " " << (double)b / out << endl;
}