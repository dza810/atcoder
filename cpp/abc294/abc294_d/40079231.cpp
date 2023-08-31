// Contest ID: abc294
// Problem ID: abc294_d ( https://atcoder.jp/contests/abc294/tasks/abc294_d )
// Title: D. Bank
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-26 10:52:20 +0000 UTC ( https://atcoder.jp/contests/abc294/submissions/40079231 ) 

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
  set<ll> called;
  ll i = 1;
  ll n, q;
  cin >> n >> q;
  rep(_, q){
    ll t;
    cin >> t;
    switch(t){
      case 1:
        called.insert(i);
        i++;
        break;
      case 2:
        ll x;
        cin >> x;
        called.erase(x);
        break;
      case 3:
        cout << *called.begin() << endl;
        break;
    }
  }

  return 0;
}