// Contest ID: abc291
// Problem ID: abc291_b ( https://atcoder.jp/contests/abc291/tasks/abc291_b )
// Title: B. Trimmed Mean
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-26 12:09:09 +0000 UTC ( https://atcoder.jp/contests/abc291/submissions/39235415 ) 

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

ll n;
vi x;
ll ans = 0LL;

int main()
{
  fastio;
  cin >> n;
  x = vi(5 * n);
  rep(i, 5 * n) cin >> x[i];
  sort(all(x));
  ans = 0LL;
  repp(i, n, 4 * n - 1)
  {
    ans += x[i];
  }

  double ansd = (double)ans;
  ansd /= (double)(3 * n);

  printf("%0.7f\n", ansd);
  return 0;
}