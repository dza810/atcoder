// Contest ID: abc287
// Problem ID: abc287_c ( https://atcoder.jp/contests/abc287/tasks/abc287_c )
// Title: C. Path Graph?
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 04:02:17 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38898820 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;

#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF 1 << 30
#define INFL 1 << 60
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
#define sz(x) (int)x.size()
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

int n, m;
vvi graph;
vb visited(300000, false);
bool dfs(int pre, int p, int g)
{
  visited[p] = true;
  if (p == g)
    return true;
  bool flg = true;
  for (auto pp : graph[p])
  {
    if (pp != pre)
    {
      flg = flg && !visited[pp];
      flg = flg && dfs(p, pp, g);
      if (!flg)
        return false;
    }
  }
  return flg;
}

int main()
{
  // input
  fastio;
  cin >> n >> m;
  graph = vvi(n);
  vi deg(n, 0);
  rep(i, m)
  {
    int a, b;
    cin >> a >> b;
    a--;
    b--;
    graph[a].pb(b);
    graph[b].pb(a);
    deg[a]++;
    deg[b]++;
  }

  // calc
  vi c1(0);
  vi c2(0);
  bool flg = true;
  rep(i, n)
  {
    if (deg[i] == 1)
      c1.pb(i);
    else if (deg[i] == 2)
      c2.pb(i);
    else
    {
      flg = false;
      break;
    }
  }

  flg = flg && sz(c1) == 2 && sz(c2) == n - 2;
  flg = flg && dfs(c1[0], c1[0], c1[1]);
  if (flg)
    rep(i, n)
    {
      flg = flg && visited[i];
    }

  // output
  cout << (flg ? "Yes" : "No") << endl;
  return 0;
}