// Contest ID: abc288
// Problem ID: abc288_c ( https://atcoder.jp/contests/abc288/tasks/abc288_c )
// Title: C. Don’t be cycle
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 03:43:23 +0000 UTC ( https://atcoder.jp/contests/abc288/submissions/38898553 ) 

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
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

int n, m;
int ans = 0;
vvi graph;
vb visited(300000, false);
int dfs(int pre, int p)
{
  visited[p] = true;
  for (auto pp : graph[p])
  {
    if (pp != pre)
    {
      if (visited[pp])
      {
        ans++;
        continue;
      }
      dfs(p, pp);
    }
  }
  return 0;
}

int main()
{
  // input
  fastio;
  cin >> n >> m;
  graph = vvi(n + 10);
  rep(i, m)
  {
    int a, b;
    cin >> a >> b;
    a -= 1;
    b -= 1;
    graph[a].pb(b);
    graph[b].pb(a);
  }

  // calc
  rep(i, n) if (!visited[i])
      dfs(i, i);

  // output
  cout << ans / 2 << endl;

  return 0;
}