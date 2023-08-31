// Contest ID: abc292
// Problem ID: abc292_b ( https://atcoder.jp/contests/abc292/tasks/abc292_b )
// Title: B. Yellow and Red Card
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-04 12:40:07 +0000 UTC ( https://atcoder.jp/contests/abc292/submissions/39426842 ) 

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
ll n, q;
vi card(110, 0);
int main()
{
  fastio;
  cin >> n >> q;
  rep(_, q)
  {
    ll t, x;
    cin >> t >> x;
    switch (t)
    {
    case 1:
      card[x]++;
      break;
    case 2:
      card[x] += 2;
      break;
    case 3:
      cout << ((card[x] >= 2) ? "Yes" : "No") << endl;
      break;

    default:
      break;
    }
  }

  return 0;
}