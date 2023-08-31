// Contest ID: abc289
// Problem ID: abc289_d ( https://atcoder.jp/contests/abc289/tasks/abc289_d )
// Title: D. Step Up Robot
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 03:28:11 +0000 UTC ( https://atcoder.jp/contests/abc289/submissions/38898328 ) 

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
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

int n;
int a[11];
int m;
int x;

vi b(100100, true);
vi dp(100100, false);

int main()
{
  fastio;
  cin >> n;
  rep(i, n) cin >> a[i];
  cin >> m;
  rep(i, m)
  {
    int bb;
    cin >> bb;
    b[bb] = false;
  }

  cin >> x;
  dp[0] = true;
  rep(xx, x + 1)
      rep(i, n)
  {
    if (xx - a[i] >= 0 && b[xx] && b[xx - a[i]])
      dp[xx] = dp[xx] || dp[xx - a[i]];
  }

  cout << (dp[x] ? "Yes" : "No") << endl;

  return 0;
}