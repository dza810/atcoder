// Contest ID: typical90
// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
// Title: 026. Independent Set on a Tree（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-17 05:14:12 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38938252 ) 

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

vi graph[101000];
ll n;

ll color[101000];

void dfs(ll c, int pre, int p)
{
  if (color[p] == 0LL)
  {
    color[p] = c;
    for (auto pp : graph[p])
    {
      if(pp == pre) continue;
      dfs(-c, p, pp);
    }
  }
}

int main()
{
  fastio;
  cin >> n;
  rep(i, n - 1)
  {
    ll a, b;
    cin >> a >> b;
    graph[a].pb(b);
    graph[b].pb(a);
  }
  dfs(1, 1, 1);
  int cp = 0;
  int cm = 0;
  rep(i, n)
  {
    if (color[i] == 1LL)
      cp++;
    else if (color[i] == -1LL)
      cm++;
  }
  ll c = 0LL;
  if (cp >= n / 2)
  {
    c = 1;
  }
  else
  {
    c = -1;
  }
  int cnt = n / 2;
  repp(i, 1, n)
  {
    if (color[i] == c)
    {
      cout << i << " ";
      cnt--;
    }
    if (cnt == 0)
      break;
  }
  cout << endl;

  return 0;
}