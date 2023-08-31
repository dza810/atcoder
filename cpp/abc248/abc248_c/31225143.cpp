// Contest ID: abc248
// Problem ID: abc248_c ( https://atcoder.jp/contests/abc248/tasks/abc248_c )
// Title: C. Dice Sum
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-24 05:47:03 +0000 UTC ( https://atcoder.jp/contests/abc248/submissions/31225143 ) 

#include "bits/stdc++.h"
#include <atcoder/modint>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
// using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  int N, M, K;
  cin >> N >> M >> K;

  vector dp(100, vector(3000, mint(0)));

  dp[0][0] = 1;

  rep(n, 0, N) {
    rep(k, 0, K) {
      rep(ai, 1, M + 1) {
          dp[n + 1][k + ai] += dp[n][k];
      }
    }
  }

  mint ans = 0;
  rep(i, 1, K + 1) { ans += dp[N][i]; }
  cout << ans.val() << endl;

  return 0;
}
