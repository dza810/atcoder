// Contest ID: abs
// Problem ID: abc085_c ( https://atcoder.jp/contests/abs/tasks/abc085_c )
// Title: 
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 12:35:23 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/38907077 ) 

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

int main()
{
  fastio;
  ll n, y;
  cin >> n >> y;
  // y = a.10000 + b.5000 + c.1000
  // a + b + c = n
  // c = n - a - b
  // y = a.10000 + b.5000 + (n - a - b).1000
  // y = a.9000  + b.4000 + n.1000
  // y - n.1000 = a.9000 + b.4000
  ll x = y - 1000LL * n;
  ll amax = x / 9000 + 1;
  rep(a, amax)
  {
    ll xx = x - a * 9000;
    ll b = xx / 4000;
    if (xx >= 0 && xx % 4000 == 0 && xx / 4000 <= n - a)
    {
      ll c = n - a - b;
      cout << a << " " << b << " " << c << endl;
      return 0;
    }
  }

  cout << "-1 -1 -1" << endl;

  return 0;
}