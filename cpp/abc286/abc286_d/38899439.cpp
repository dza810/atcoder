// Contest ID: abc286
// Problem ID: abc286_d ( https://atcoder.jp/contests/abc286/tasks/abc286_d )
// Title: D. Money in Hand
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 04:56:52 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38899439 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;

#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF (1 << 30)
#define INFL (1LL << 62)
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
#define repp(i, start, end) for (int i = start; i <= end; i++)
#define repp_rev(i, start, end) for (int i = start; i >= end; i--)
#define sz(x) (int)x.size()
#define chmax(x, y) x = max(x, y)
#define chmin(x, y) x = min(x, y)
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<bool>> vvb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

ll n, x;
vi a;
vi b;

int main()
{
  fastio;
  cin >> n >> x;
  a = vi(n);
  b = vi(n);
  rep(i, n) cin >> a[i] >> b[i];

  vvb dp(n + 1, vb(x + 6000, false));
  dp[0][0] = true;
  rep(i, n)
  {
    rep(xx, x + 1)
        dp[i + 1][xx] = dp[i][xx];

    repp(bb, 1, b[i])
    {
      rep(xx, x + 1)
      {
        ll v = bb * a[i];
        if (xx >= v)
          dp[i + 1][xx] = dp[i + 1][xx] || dp[i][xx - v];
      }
    }
  }

  cout << ((dp[n][x]) ? "Yes" : "No") << endl;

  return 0;
}