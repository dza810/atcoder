// Contest ID: abc300
// Problem ID: abc300_c ( https://atcoder.jp/contests/abc300/tasks/abc300_c )
// Title: C. Cross
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-29 12:41:06 +0000 UTC ( https://atcoder.jp/contests/abc300/submissions/41038398 ) 

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

ll x[4] = {1, 1, -1, -1};
ll y[4] = {1, -1, -1, 1};

int main()
{
  fastio;
  ll H, W;
  cin >> H >> W;
  ll N = min(H, W);
  vi ans(N + 1, 0);
  vector<vector<char>>
      c(H + 10, vector<char>(W + 10, '.'));
  repp(i, 1, H) repp(j, 1, W) cin >> c[i][j];
  repp(i, 1, H) repp(j, 1, W) // 10^4
  {                           // ij
    if (c[i][j] == '.')
      continue;
    ll d = 0;
    bool is_ok = true;
    while (is_ok) // min(100,100)=10^2
    {
      d++;
      rep(xy, 4) // 4
      {          // xy
        is_ok = is_ok && 1 <= i + d * x[xy] && i + d * x[xy] <= H;
        is_ok = is_ok && 1 <= j + d * y[xy] && j + d * y[xy] <= W;
        is_ok = is_ok && c[i + d * x[xy]][j + d * y[xy]] == '#';
      } // xy
    }
    if (d > 1)
      ans[d - 1]++;
  } // ij
  repp(i, 1, N) cout << ans[i] << " ";
  cout << endl;

  return 0;
}