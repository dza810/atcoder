// Contest ID: typical90
// Problem ID: typical90_ak ( https://atcoder.jp/contests/typical90/tasks/typical90_ak )
// Title: 037. Don't Leave the Spice（★5）
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-16 02:16:47 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38916582 ) 

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

ll w, n;
ll l[510];
ll r[510];
ll v[510];
ll op(ll a, ll b) { return max(a, b); }

ll e() { return -1LL; }

int main()
{
  fastio;
  cin >> w >> n;
  rep(i, n) cin >> l[i] >> r[i] >> v[i];

  atcoder::segtree<ll, op, e> dp(w + 1);
  atcoder::segtree<ll, op, e> prev;
  dp.set(0, 0);
  rep(i, n)
  {
    prev = dp;
    repp(ww, 0, w)
    {
      ll vv = prev.prod(max(0LL, ww - r[i]), max(0LL, ww - l[i] + 1));

      if (vv < 0)
        continue;
      vv += v[i];
      if (prev.get(ww) < vv)
      {
        dp.set(ww, vv);
      }
    }
  }
  cout << dp.get(w) << endl;

  return 0;
}