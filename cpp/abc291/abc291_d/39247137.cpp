// Contest ID: abc291
// Problem ID: abc291_d ( https://atcoder.jp/contests/abc291/tasks/abc291_d )
// Title: D. Flip Cards
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-26 12:29:16 +0000 UTC ( https://atcoder.jp/contests/abc291/submissions/39247137 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF (1LL << 60)
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
ll op(ll x, ll y) { return max(x, y); }
ll e() { return 0LL; }

ll n;
vi a, b;

int main()
{
  fastio;
  cin >> n;
  a = vi(n);
  b = vi(n);
  rep(i, n) cin >> a[i] >> b[i];
  vvi dp(n, vi(2, 0));
  dp[0][0] = 1;
  dp[0][1] = 1;

  repp(i, 1, n - 1)
  {
    if (a[i - 1] != a[i])
      dp[i][0] += dp[i - 1][0];
    dp[i][0] %= 998244353;
    if (b[i - 1] != a[i])
      dp[i][0] += dp[i - 1][1];
    dp[i][0] %= 998244353;

    if (b[i - 1] != b[i])
      dp[i][1] += dp[i - 1][1];
    dp[i][1] %= 998244353;

    if (a[i - 1] != b[i])
      dp[i][1] += dp[i - 1][0];
    dp[i][1] %= 998244353;
  }
  ll ans = (dp[n - 1][0] + dp[n - 1][1]) % 998244353;
  cout << ans << endl;
  return 0;
}
