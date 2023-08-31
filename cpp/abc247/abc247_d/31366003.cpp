// Contest ID: abc247
// Problem ID: abc247_d ( https://atcoder.jp/contests/abc247/tasks/abc247_d )
// Title: D. Cylinder
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-30 13:17:05 +0000 UTC ( https://atcoder.jp/contests/abc247/submissions/31366003 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<ll, ll>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  queue<P> A;
  int Q;
  cin >> Q;
  P last = {0, 0};
  rep(q, 0, Q) {
    int t;
    cin >> t;
    if (t == 1) {
      ll x, c;
      cin >> x >> c;
      A.push({x, c});
    }
    if (t == 2) {
      ll c;
      ll ans = 0;
      cin >> c;
      while (c > 0) {
        if (last.second == 0) {
          last = A.front();
          A.pop();
        }
        if (c >= last.second) {
          ll use = last.second;
          ans += 1LL * last.first * use;
          c -= use;
          last.second -= use;
        }
        if (c < last.second) {
          ll use = c;
          ans += 1LL * last.first * use;
          c -= use;
          last.second -= use;
        }
      }
      cout << ans << endl;
    }
  }

  return 0;
}
