// Contest ID: abc246
// Problem ID: abc246_a ( https://atcoder.jp/contests/abc246/tasks/abc246_a )
// Title: A. Four Points
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-04 08:56:08 +0000 UTC ( https://atcoder.jp/contests/abc246/submissions/30718720 ) 

#include<iostream>
#include<vector>
using namespace std;

int main(){
  vector<int> x(3);
  vector<int> y(3);
  for(int i=0; i<3; i++){
    cin >> x[i] >> y[i];
  }
  for(int i=0; i<3; i++){
    x[i] == x[(i+1) % 3] && cout << x[(i+2) % 3] << " ";
  }
  for(int i=0; i<3; i++){
    y[i] == y[(i+1) % 3] && cout << y[(i+2) % 3] << " ";
  }
}