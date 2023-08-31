// Contest ID: abc298
// Problem ID: abc298_b ( https://atcoder.jp/contests/abc298/tasks/abc298_b )
// Title: B. Coloring Matrix
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-15 12:42:03 +0000 UTC ( https://atcoder.jp/contests/abc298/submissions/40656166 ) 

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

int main()
{
  fastio;
  ll n;
  ll a[110][110];
  ll aa[110][110];
  ll b[110][110];
  cin >> n;
  repp(i, 1, n) repp(j, 1, n) cin >> a[i][j];
  repp(i, 1, n) repp(j, 1, n) cin >> b[i][j];
  bool ans = true;
  rep(rot, 4)
  {
    repp(i, 1, n) repp(j, 1, n) aa[i][j] = a[i][j];
    repp(i, 1, n) repp(j, 1, n)
        a[n + 1 - j][i] = aa[i][j];
    ans = true;
    repp(i, 1, n) repp(j, 1, n)
    {
      ans = ans && (a[i][j] == 0 || b[i][j] == 1);
      if (!ans)
        break;
    }
    if (ans) break;
  }

  cout << ((ans) ? "Yes" : "No") << endl;

  return 0;
}