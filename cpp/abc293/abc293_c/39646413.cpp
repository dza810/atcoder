// Contest ID: abc293
// Problem ID: abc293_c ( https://atcoder.jp/contests/abc293/tasks/abc293_c )
// Title: C. Make Takahashi Happy 
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-11 14:25:06 +0000 UTC ( https://atcoder.jp/contests/abc293/submissions/39646413 ) 

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

ll h, w;
ll a[20][20];
map<ll, ll> route[20][20];
map<ll, ll> dp[20][20];

bool visited[1100000000] = {false};

ll dfs(ll x, ll y)
{
  if (0 > x || 0 > y || x >= h || y >= w)
    return 0;

  if (!visited[a[x][y]])
  {
    if (x == h - 1 && y == w - 1)
      return 1;
    visited[a[x][y]] = true;
    ll ans = dfs(x + 1, y) + dfs(x, y + 1);
    visited[a[x][y]] = false;
    return ans;
  }
  return 0;
}

int main()
{
  fastio;
  cin >> h >> w;
  rep(hh, h) rep(ww, w) cin >> a[hh][ww];
  cout << dfs(0, 0) << endl;
  return 0;
}