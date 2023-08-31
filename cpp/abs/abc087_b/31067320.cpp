// Contest ID: abs
// Problem ID: abc087_b ( https://atcoder.jp/contests/abs/tasks/abc087_b )
// Title: 
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-17 12:14:58 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/31067320 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int A, B, C, X;
int main() {
  cin >> A >> B >> C >> X;
  int ans = 0;
  rep(a, 0, A + 1) {
    rep(b, 0, B + 1) {
      if (0 <= (X - 500 * a - 100 * b) && (X - 500 * a - 100 * b) <= 50 * C) {
        ans++;
      }
    }
  }
  cout << ans << endl;
  return 0;
}