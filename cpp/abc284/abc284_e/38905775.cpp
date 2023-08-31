// Contest ID: abc284
// Problem ID: abc284_e ( https://atcoder.jp/contests/abc284/tasks/abc284_e )
// Title: E. Count Simple Paths
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 11:47:23 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38905775 ) 

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
ll ans = 0;
ll n, m;
vi graph[201000];
vb visited(201000, false);
void dfs(ll pre, ll p)
{
  if (visited[p])
    return;
  visited[p] = true;
  ans++;
  if (ans >= 1000000)
    return;
  for (auto pp : graph[p])
  {
    if (pp == pre)
      continue;
    dfs(p, pp);
    if (ans >= 1000000)
      return;
  }
  visited[p] = false;
  return;
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
    graph[u].pb(v);
    graph[v].pb(u);
  }
  dfs(0, 0);
  cout << min(ans, 1000000LL) << endl;
  return 0;
}