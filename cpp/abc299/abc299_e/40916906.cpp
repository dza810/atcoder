// Contest ID: abc299
// Problem ID: abc299_e ( https://atcoder.jp/contests/abc299/tasks/abc299_e )
// Title: E. Nearest Black Vertex
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-24 07:19:57 +0000 UTC ( https://atcoder.jp/contests/abc299/submissions/40916906 ) 

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

vi tbl[2100];
ll n, m;

vi bfs(ll s)
{
  deque<ll> q;
  vi dist(n, INF);
  dist[s] = 0;
  q.push_back(s);
  while (!q.empty())
  {
    ll v = q.front();
    q.pop_front();
    for (ll w : tbl[v])
    {
      if (chmin(dist[w], dist[v] + 1))
        q.push_back(w);
    }
  }
  return dist;
}

int main()
{
  fastio;
  cin >> n >> m;
  rep(i, m)
  {
    ll u, v;
    cin >> u >> v;
    u--;
    v--;
    tbl[u].pb(v);
    tbl[v].pb(u);
  }

  ll k;
  cin >> k;
  vi c(n, -1);
  rep(i, k)
  {
    ll p, d;
    cin >> p >> d;
    p--;
    c[p] = d;
  }

  string S(n, '0');

  vi done(n, false);
  rep(i, n) done[i] = c[i] == -1;

  rep(v, n)
  {
    vi dist = bfs(v);
    bool flg = true;
    rep(w, n)
        flg = flg && dist[w] >= c[w];
    if (flg)
    {
      S[v] = '1';
      rep(w, n) done[w] = done[w] || dist[w] == c[w];
    }
  }

  bool flg = true;
  rep(w, n) flg = flg && done[w];

  if (flg)
  {
    cout << "Yes" << endl;
    cout << S << endl;
  }
  else
  {
    cout << "No" << endl;
  }

  return 0;
}