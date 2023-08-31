// Contest ID: abc244
// Problem ID: abc244_e ( https://atcoder.jp/contests/abc244/tasks/abc244_e )
// Title: E. King Bombee
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-03-22 16:13:59 +0000 UTC ( https://atcoder.jp/contests/abc244/submissions/30355143 ) 

#include <iostream>
#include <vector>
using namespace std;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using ll = int64_t;
using P = pair<int, int>;
using vi = vector<ll>;
using vvi = vector<vi>;
#define MOD 998244353

int main()
{
  int n, m, k, s, t, x;
  cin >> n >> m >> k >> s >> t >> x;
  s--;
  t--;
  x--;
  vector<P> edge(m);
  for (auto &[u, v] : edge)
  {
    cin >> u >> v;
    u--;
    v--;
  }
  vector<vvi> dp(k + 1, vvi(n, vi(2, 0)));
  dp[0][s][0] = 1;

  rep(kk, 1, k + 1)
  {
    for (auto &[u, v] : edge)
      rep(c, 0, 2)
      {
        dp[kk][u][c] += dp[kk - 1][v][u == x ? 1 - c : c] % MOD;
        dp[kk][v][c] += dp[kk - 1][u][v == x ? 1 - c : c] % MOD;
      }
  }
  cout << (dp[k][t][0] % MOD) << endl;

  return 0;
}
