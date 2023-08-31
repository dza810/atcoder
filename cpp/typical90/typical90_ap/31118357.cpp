// Contest ID: typical90
// Problem ID: typical90_ap ( https://atcoder.jp/contests/typical90/tasks/typical90_ap )
// Title: 042. Multiple of 9（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-20 12:13:02 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31118357 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int MOD = 1'000'000'007;

int main() {
  int K;
  cin >> K;
  if ((K % 9) != 0) {
    cout << 0 << endl;
    return 0;
  }

  vi dp(K+1, 0);
  dp[0] = 1;
  rep(k, 1, K + 1) {
    rep(i, 1, min(k+1, 10)) {
      if (k - i >= 0) {
        dp[k] += dp[k - i];
        dp[k] %= MOD;
      }
    }
  }
  cout << (dp[K] % MOD) << endl;

  return 0;
}
