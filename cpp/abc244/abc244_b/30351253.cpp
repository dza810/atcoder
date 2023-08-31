// Contest ID: abc244
// Problem ID: abc244_b ( https://atcoder.jp/contests/abc244/tasks/abc244_b )
// Title: B. Go Straight and Turn Right
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-03-22 12:51:28 +0000 UTC ( https://atcoder.jp/contests/abc244/submissions/30351253 ) 

// #include <bits/stdc++.h>
#include <iostream>
#include <vector>
using namespace std;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using ll = int64_t;
using P = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vi>;

int main() {
  int n;
  cin >> n;
  int dx = 1;
  int dy = 0;
  int tmp;
  int x = 0;
  int y = 0;
  char t;
  rep(i, 0, n){
    cin >> t;
    switch(t){
      case 'R':
        tmp = dx;
        dx = dy;
        dy = - tmp;
        break;
      case 'S':
        x += dx;
        y += dy;
        break;
      default:
        break;
    }
  }
  cout << x << ' ' << y << '\n';
}
