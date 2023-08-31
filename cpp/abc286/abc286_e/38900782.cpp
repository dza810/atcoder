// Contest ID: abc286
// Problem ID: abc286_e ( https://atcoder.jp/contests/abc286/tasks/abc286_e )
// Title: E. Souvenir
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 06:32:55 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38900782 ) 

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
// const pair<int, int> INF2 = {INF, INF};
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<bool>> vvb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;
template <typename T, typename S>
pair<T, S> operator+(pair<T, S> x, pair<T, S> y)
{
  T t = x.first + y.first;
  S s = x.second + y.second;
  return {t, s};
}

ll n, x, q;
ll a[310];
bool tbl[310][310];
pair<ll, ll> dist[310][310];

int main()
{
  fastio;
  cin >> n;
  rep(i, n) cin >> a[i];

  rep(i, n) rep(j, n)
  {
    char c;
    cin >> c;
    tbl[i][j] = (c == 'Y');
  }
  cin >> q;
  rep(i, n) rep(j, n)
  {
    if (i == j)
      dist[i][j] = {0LL, 0LL};
    else if (tbl[i][j])
      dist[i][j] = {1LL, -a[j]};
    else
      dist[i][j] = {INFL, 0};
  }
  rep(k, n)
      rep(i, n)
          rep(j, n)
              chmin(dist[i][j], dist[i][k] + dist[k][j]);

  rep(_, q)
  {
    ll u, v;
    cin >> u >> v;
    u--;
    v--;
    if (dist[u][v].first >= INFL)
      cout << "Impossible" << endl;
    else
      cout << dist[u][v].first << " " << -dist[u][v].second + a[u] << endl;
  }

  return 0;
}