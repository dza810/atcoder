// Contest ID: abc303
// Problem ID: abc303_b ( https://atcoder.jp/contests/abc303/tasks/abc303_b )
// Title: B. Discord
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-05-27 12:42:48 +0000 UTC ( https://atcoder.jp/contests/abc303/submissions/41753496 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define INF (1LL << 60)
#define endl "\n"
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define rep(i, end) for (ll i = 0; i < end; i++)
#define repp(i, start, end) for (ll i = start; i <= end; i++)
#define repp_rev(i, start, end) for (ll i = start; i >= end; i--)
#define sz(x) (ll) x.size()
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
  ll N, M;
  ll a[60][60];
  vvb unfriend(60, vb(60, true));

  cin >> N >> M;
  rep(i, M) rep(j, N) cin >> a[i][j];

  rep(i, M) rep(j, N)
  {
    ll *aa = a[i];
    if (j - 1 >= 0)
    {
      ll x = min(aa[j], aa[j - 1]);
      ll y = max(aa[j], aa[j - 1]);
      unfriend[x][y] = false;
    }
    if (j + 1 < N)
    {
      ll x = min(aa[j], aa[j + 1]);
      ll y = max(aa[j], aa[j + 1]);
      unfriend[x][y] = false;
    }
  }
  ll ans = 0;
  repp(i, 1, N) repp(j, i + 1, N)
  {
    if (unfriend[i][j])
      ans++;
  }
  cout << ans << endl;
  return 0;
}
