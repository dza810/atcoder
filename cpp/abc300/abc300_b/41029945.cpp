// Contest ID: abc300
// Problem ID: abc300_b ( https://atcoder.jp/contests/abc300/tasks/abc300_b )
// Title: B. Same Map in the RPG World
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-29 12:12:48 +0000 UTC ( https://atcoder.jp/contests/abc300/submissions/41029945 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define INF (1LL << 60)
#define endl "\n"
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
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

int main()
{
  fastio;
  ll H, W;
  cin >> H >> W;
  char a[40][40];
  rep(i, H) rep(j, W) cin >> a[i][j];
  char b[40][40];
  rep(i, H) rep(j, W) cin >> b[i][j];
  rep(s, H) rep(t, W)
  {
    bool is_ok = true;
    rep(i, H)
    {
      rep(j, W)
      {
        is_ok = is_ok && a[(i + s) % H][(j + t) % W] == b[i][j];
        if (!is_ok)
          break;
      }
      if (!is_ok)
        break;
    }
    if (is_ok)
    {
      cout << "Yes" << endl;
      return 0;
    }
  }
  cout << "No" << endl;

  return 0;
}