// Contest ID: abc285
// Problem ID: abc285_e ( https://atcoder.jp/contests/abc285/tasks/abc285_e )
// Title: E. Work or Rest
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-18 11:06:59 +0000 UTC ( https://atcoder.jp/contests/abc285/submissions/38966205 ) 

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
#define rep(i, end) for (ll i = 0; i < end; i++)
#define repp(i, start, end) for (ll i = start; i <= end; i++)
#define repp_rev(i, start, end) for (ll i = start; i >= end; i--)
#define sz(x) (int)x.size()
#define chmax(x, y) (x < (y)) ? (x = (y), true) : false
#define chmin(x, y) (x > (y)) ? (x = (y), true) : false
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
ll a[5100];
ll b[5100];
vvi dp;

int main()
{
  fastio;
  cin >> n;
  dp = vvi(n + 1, vi(n + 1, 0));
  repp(i, 1, n) cin >> a[i];

  rep(d, n)
  {
    b[d] = 0;
    repp(i, 1, d)
    {
      b[d] += a[(i + 1) / 2];
    }
  }
  dp[0][0] = 0;

  rep(i, n)
  {
    rep(j, i)
    {
      chmax(dp[i + 1][j + 1], dp[i][j]);
      chmax(dp[i + 1][0], dp[i][j] + b[j]);
    }
  }

  ll ans = 0;
  rep(i, n)
  {
    chmax(ans, dp[n][i] + b[i]);
  }
  cout << ans << endl;
  return 0;
}