// Contest ID: typical90
// Problem ID: typical90_h ( https://atcoder.jp/contests/typical90/tasks/typical90_h )
// Title: 008. AtCounter（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-14 11:52:46 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30964509 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const num INF = 2000000000;
const num mod = 1000000007;
const string atcoder = " atcoder";

int main() {
  int N;
  string S;
  cin >> N >> S;
  vvi dp(N + 1, vi(8, 0));
  dp[0][0] = 1;
  rep(i, 0, N) {
    rep(j, 0, 8) {
      dp[i + 1][j] = dp[i][j] % mod;
      if (atcoder[j] == S[i]) {
        dp[i + 1][j] += dp[i][j - 1];
      }
      dp[i + 1][j] %= mod;
    }
  }
  cout << dp[N][7] << endl;
  return 0;
}