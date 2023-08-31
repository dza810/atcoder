// Contest ID: abc181
// Problem ID: abc181_c ( https://atcoder.jp/contests/abc181/tasks/abc181_c )
// Title: C. Collinearity
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-11-07 08:09:52 +0000 UTC ( https://atcoder.jp/contests/abc181/submissions/17921478 ) 

#include <bits/stdc++.h>
using namespace std;

int main() {
  int N, ans = 0;
  int x, y;
  vector<pair<int, int>> points;
  cin >> N;
  for (int i = 0; i < N; i++) {
    cin >> x >> y;
    points.push_back(pair<int, int>(x, y));
  }
  int x1, x2, x3, y1, y2, y3;
  int a, b;
  for (int i = 0; i < N; i++) {
    x1 = points[i].first;
    y1 = points[i].second;
    for (int j = 0; j < i; j++) {
      x2 = points[j].first;
      y2 = points[j].second;
      for (int k = 0; k < N; k++) {
        if (k == i || k == j) {
          continue;
        }
        x3 = points[k].first;
        y3 = points[k].second;
        if ((x1 - x2) * (y3 - y1) - (y1 - y2) * (x3 - x1) == 0) {
          cerr << "(" << x1 << "," << y1 << ") (" << x2 << "," << y2 << ") ("
               << x3 << "," << y3 << ")\n";
          cout << "Yes" << endl;
          return 0;
        }
      }
    }
  }
  cout << "No" << endl;
}