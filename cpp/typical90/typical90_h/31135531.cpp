// Contest ID: typical90
// Problem ID: typical90_h ( https://atcoder.jp/contests/typical90/tasks/typical90_h )
// Title: 008. AtCounter（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 12:38:02 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31135531 ) 

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
const int INF = 1 << 30;
string atcoder = " atcoder";

int main() {
  int N;
  string S;
  cin >> N >> S;
  vvi dp(N + 1, vi(8, 0));
  dp[0][0] = 1;
  rep(i, 1, N + 1) {
    rep(j, 0, 8) {
      dp[i][j] += dp[i - 1][j];
      if (S[i-1] == atcoder[j])
        dp[i][j] += dp[i - 1][j - 1];
      dp[i][j] %= MOD;
        }
  }
  cout << dp[N][7] << endl;

  return 0;
}
