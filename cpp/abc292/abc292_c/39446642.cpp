// Contest ID: abc292
// Problem ID: abc292_c ( https://atcoder.jp/contests/abc292/tasks/abc292_c )
// Title: C. Four Variables
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-04 14:06:17 +0000 UTC ( https://atcoder.jp/contests/abc292/submissions/39446642 ) 

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

map<ll, ll> cache;

int main()
{
  fastio;
  ll n;
  cin >> n;
  ll ans = 0;
  vi calc(n + 1, 0);

  repp(x, 1, n)
  {
    ll k = 1;
    while (k * x <= n)
    {
      calc[k * x]++;
      k++;
    }
  }

  repp(i, 1, n - 1)
  {
    ans += calc[i] * calc[n - i];
  }
  cout << ans << endl;
  return 0;
}