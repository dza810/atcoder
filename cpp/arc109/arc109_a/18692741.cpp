// Contest ID: arc109
// Problem ID: arc109_a ( https://atcoder.jp/contests/arc109/tasks/arc109_a )
// Title: A. Hands
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-12-12 04:31:41 +0000 UTC ( https://atcoder.jp/contests/arc109/submissions/18692741 ) 

#include <bits/stdc++.h>
using namespace std;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using ll = int64_t;
using P = pair<int, int>;
using vi = vector<int>;
using vvi = vector<vi>;
const int INF = 1000000;

int main() {
  int a, b, x, y;
  cin >> a >> b >> x >> y;
  int yy = min(2 * x, y);
  if (a > b) {
    cout << (a - b - 1) * yy + x << endl;
  } else if (b > a) {
    cout << (b - a) * yy + x << endl;
  } else {
    cout << x << endl;
  }
  return 0;
}
