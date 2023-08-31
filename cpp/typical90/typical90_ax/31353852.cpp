// Contest ID: typical90
// Problem ID: typical90_ax ( https://atcoder.jp/contests/typical90/tasks/typical90_ax )
// Title: 050. Stair Jump（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-30 01:50:52 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31353852 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  int N, L;
  cin >> N >> L;
  vector<mint> dp(N + 1, mint(0));
  dp[0] = mint(1);
  rep(i, 1, N + 1) {
    dp[i] += dp[i - 1];
    if (i >= L)
      dp[i] += dp[i - L];
  }
  cout << dp[N].val() << endl;

  return 0;
}
