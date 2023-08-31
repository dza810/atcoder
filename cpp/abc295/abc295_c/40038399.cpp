// Contest ID: abc295
// Problem ID: abc295_c ( https://atcoder.jp/contests/abc295/tasks/abc295_c )
// Title: C. Socks
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-25 12:26:50 +0000 UTC ( https://atcoder.jp/contests/abc295/submissions/40038399 ) 

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

map<ll,ll> color;
ll n;

int main()
{
  fastio;
  cin >> n;
  rep(i, n) {
    ll a;
    cin >> a;
    color[a]++;
  }
  ll ans = 0;
  for(auto [k,v] : color){
    ans += v / 2;
  }
  cout << ans << endl;
  return 0;
}