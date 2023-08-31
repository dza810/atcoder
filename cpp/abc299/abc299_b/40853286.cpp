// Contest ID: abc299
// Problem ID: abc299_b ( https://atcoder.jp/contests/abc299/tasks/abc299_b )
// Title: B. Trick Taking
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-22 12:31:27 +0000 UTC ( https://atcoder.jp/contests/abc299/submissions/40853286 ) 

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
  ll N, T;
  cin >> N >> T;
  map<ll, vi> c;
  vi r(N);
  ll tmp;
  cin >> tmp;
  ll p0 = tmp;
  c[tmp].push_back(0);

  repp(i, 1, N - 1)
  {
    cin >> tmp;
    c[tmp].push_back(i);
  }
  rep(i, N) cin >> r[i];

  ll ans = -1;
  ll color = (c.count(T) > 0) ? T : p0;
  for (auto cc : c[color])
  {
    if (ans == -1)
      ans = cc;
    else if (r[cc] > r[ans])
    {
      ans = cc;
    }
  }
  cout << ans + 1 << endl;

  return 0;
}