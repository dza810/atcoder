// Contest ID: abc298
// Problem ID: abc298_a ( https://atcoder.jp/contests/abc298/tasks/abc298_a )
// Title: A. Job Interview
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-15 12:04:45 +0000 UTC ( https://atcoder.jp/contests/abc298/submissions/40638748 ) 

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
  ll good = 0;
  ll ok = 0;
  ll bad = 0;

  cin >> n;
  rep(i, n)
  {
    char s;
    cin >> s;
    if (s == 'o')
      good++;
    if (s == '-')
      ok++;
    if (s == 'x')
      bad++;
  }
  cout << ((good >= 1 && bad == 0) ? "Yes" : "No") << endl;

  return 0;
}