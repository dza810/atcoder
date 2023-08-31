// Contest ID: abc261
// Problem ID: abc261_d ( https://atcoder.jp/contests/abc261/tasks/abc261_d )
// Title: D. Flipping and Bonus
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-18 11:44:21 +0000 UTC ( https://atcoder.jp/contests/abc261/submissions/38967026 ) 

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

ll n, m;
ll x[5100];
vi bonus(5100, 0);

vvi dp(5100, vi(5100, 0));

int main()
{
  fastio;
  cin >> n >> m;
  rep(i, n) cin >> x[i];
  rep(i, m)
  {
    ll c, y;
    cin >> c >> y;
    bonus[c] = y;
  }

  rep(i, n)
  {
    repp(c, 0, i)
    {
      chmax(dp[i + 1][c + 1], dp[i][c] + x[i] + bonus[c + 1]);
      chmax(dp[i + 1][0], dp[i][c]);
    }
  }
  ll ans = 0;
  repp(c, 0, n + 1)
  {
    chmax(ans, dp[n][c]);
  }

  cout << ans << endl;
  return 0;
}