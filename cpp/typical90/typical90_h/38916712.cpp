// Contest ID: typical90
// Problem ID: typical90_h ( https://atcoder.jp/contests/typical90/tasks/typical90_h )
// Title: 008. AtCounter（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-16 02:27:32 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38916712 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF (1 << 20)
#define INFL (1LL << 60)
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
#define repp(i, start, end) for (int i = start; i <= end; i++)
#define repp_rev(i, start, end) for (int i = start; i >= end; i--)
#define sz(x) (int)x.size()
#define chmax(x, y) x = max((x), (y))
#define chmin(x, y) x = min((x), (y))
typedef long long ll;
typedef vector<ll> vi;
typedef vector<bool> vb;
typedef vector<vector<bool>> vvb;
typedef vector<vector<ll>> vvi;
typedef pair<ll, ll> pi;
template <typename T, typename S>
pair<T, S> operator+(pair<T, S> x, pair<T, S> y)
{
  T t = x.first + y.first;
  S s = x.second + y.second;
  return {t, s};
}

ll n;
string atcoder_ = "atcoder";
char s[100100];
int main()
{
  fastio;
  cin >> n;
  rep(i, n) cin >> s[i];

  vvi dp(n + 1, vi(7, 0));
  rep(i, n)
  {
    rep(j, 7)
        dp[i + 1][j] = dp[i][j];

    rep(j, 7)
    {
      if (atcoder_[j] == s[i])
      {
        dp[i + 1][j] += (j == 0) ? 1 : dp[i][j - 1];
        dp[i + 1][j] %= MOD;
      }
    }
  }
  cout << dp[n][6] << endl;
  return 0;
}