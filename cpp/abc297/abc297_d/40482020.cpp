// Contest ID: abc297
// Problem ID: abc297_d ( https://atcoder.jp/contests/abc297/tasks/abc297_d )
// Title: D. Count Subtractions
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-09 12:52:05 +0000 UTC ( https://atcoder.jp/contests/abc297/submissions/40482020 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
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

int main()
{
  fastio;
  ll a, b;
  cin >> a >> b;
  ll ans = 0LL;
  while (a != b)
  {
    if (a > b)
    {
      ans += ll(a / b);
      a = a % b;
    }
    else if (a < b)
    {
      ans += b / a;
      b = b % a;
    }
    if (a == 0 || b == 0)
    {
      ans--;
      break;
    }
  }
  cout << ans << endl;
  return 0;
}