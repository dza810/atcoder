// Contest ID: abc286
// Problem ID: abc286_c ( https://atcoder.jp/contests/abc286/tasks/abc286_c )
// Title: C. Rotate and Palindrome
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 04:28:14 +0000 UTC ( https://atcoder.jp/contests/abc286/submissions/38899098 ) 

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
#define sz(x) (int)x.size()
#define chmax(x, y) x = max(x, y)
#define chmin(x, y) x = min(x, y)
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

ll n, a, b;
string s;

ll calc(ll shft)
{
  ll cnt = 0;
  rep(i, n / 2)
  {
    if (s.at(mod(i + shft, n)) != s.at(mod(n - 1 + shft - i, n)))
    {
      cnt++;
    }
  }
  return (a * shft + b * cnt);
}

int main()
{
  fastio;
  cin >> n >> a >> b >> s;
  ll ans = INFL;
  rep(shft, n) chmin(ans, calc(shft));
  cout << ans << endl;

  return 0;
}