// Contest ID: abc258
// Problem ID: abc258_b ( https://atcoder.jp/contests/abc258/tasks/abc258_b )
// Title: B. Number Box
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-27 02:12:20 +0000 UTC ( https://atcoder.jp/contests/abc258/submissions/40090582 ) 

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

ll di[8] = {1, 1, 0,-1,-1,-1, 0, 1};
ll dj[8] = {0, 1, 1, 1, 0,-1,-1,-1};

int main()
{
  fastio;
  ll n;
  cin >> n;
  vvi a(n, vi(n, 0));
  rep(i, n) rep(j, n)
  {
    char x;
    cin >> x;
    a[i][j] = (ll)(x - '0');
  }
  ll ans = 0;

  rep(k, 8) rep(i, n) rep(j, n)
  {
    ll ii = i;
    ll jj = j;
    ll tmp = a[i][j];
    rep(l, n - 1)
    {
      ii += di[k] + n;
      ii %= n;
      jj += dj[k] + n;
      jj %= n;
      tmp = tmp * 10 + a[ii][jj];
    }
    ans = max(ans, tmp);
  }
  cout << ans << endl;
  return 0;
}