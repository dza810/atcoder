// Contest ID: typical90
// Problem ID: typical90_ap ( https://atcoder.jp/contests/typical90/tasks/typical90_ap )
// Title: 042. Multiple of 9（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-29 12:47:45 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31345212 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = int;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  int K;
  cin >> K;
  if (K % 9 != 0) {
    cout << 0 << endl;
    return 0;
  }
  vector<mint> dp(K + 1, mint(0));
  dp[0] = 1;
  rep(i, 1, K + 1) {
    rep(j, 1, 10) {
      if (i - j >= 0)
        dp[i] += dp[i - j];
    }
  }
  cout << dp[K].val() << endl;

  return 0;
}
