// Contest ID: abc298
// Problem ID: abc298_d ( https://atcoder.jp/contests/abc298/tasks/abc298_d )
// Title: D. Writing a Numeral
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-22 08:00:52 +0000 UTC ( https://atcoder.jp/contests/abc298/submissions/40823688 ) 

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
using mint = atcoder::modint998244353;

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
  ll q;
  cin >> q;
  mint s = 1;
  deque<ll> S;
  S.pb(1);
  rep(_, q)
  {
    ll t;
    cin >> t;
    if (t == 1)
    {
      ll x;
      cin >> x;
      S.pb(x);
      s = s * 10 + x;
    }
    else if (t == 2)
    {
      s -= mint(10).pow(S.size() - 1) * S.front();
      S.pop_front();
    }
    else if (t == 3)
    {
      cout << s.val() << endl;
    }
  }
  return 0;
}