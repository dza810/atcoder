// Contest ID: abc291
// Problem ID: abc291_e ( https://atcoder.jp/contests/abc291/tasks/abc291_e )
// Title: E. Find Permutation
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-26 19:10:37 +0000 UTC ( https://atcoder.jp/contests/abc291/submissions/39278655 ) 

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
bool operator<(pair<T, S> x, pair<T, S> y)
{
  return (x.first < y.first || (x.first == y.first && x.second < y.second));
}

template <typename T, typename S>
pair<T, S> operator+(pair<T, S> x, pair<T, S> y)
{
  T t = x.first + y.first;
  S s = x.second + y.second;
  return {t, s};
}
ll op(ll x, ll y) { return max(x, y); }
ll e() { return 0LL; }

ll n, m;
vi x, y;
vvi graph;
vi ans;

int main()
{
  fastio;
  cin >> n >> m;
  x = vi(m);
  y = vi(m);
  vi deg(n);
  graph = vvi(n);
  rep(i, m)
  {
    cin >> x[i] >> y[i];
    x[i]--;
    y[i]--;
    deg[y[i]]++;
    graph[x[i]].pb(y[i]);
  }
  bool flg = true;
  ans = vi(n, 0);
  ll v = 1;
  set<ll> s;
  rep(i, n) if (deg[i] == 0) s.insert(i);
  while (!s.empty())
  {
    if (sz(s) != 1)
    {
      flg = false;
      break;
    }
    ll p = *s.begin();
    s.erase(p);
    ans[p] = v++;

    for (auto pp : graph[p])
    {
      deg[pp]--;
      if (deg[pp] == 0)
      {
        s.insert(pp);
      }
    }
  }

  if (flg)
  {
    cout << "Yes" << endl;
    rep(i, n - 1) cout << ans[i] << " ";
    cout << ans[n - 1] << endl;
  }
  else
  {
    cout << "No" << endl;
  }

  return 0;
}