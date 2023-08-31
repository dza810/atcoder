// Contest ID: abc298
// Problem ID: abc298_c ( https://atcoder.jp/contests/abc298/tasks/abc298_c )
// Title: C. Cards Query Problem
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-15 12:35:14 +0000 UTC ( https://atcoder.jp/contests/abc298/submissions/40653240 ) 

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
  ll q;
  
  cin >> n >> q;
  vector<multiset<ll>> box(200010);
  vector<set<ll>> card(200010);
  rep(_, q)
  {
    ll t;
    ll i, j;
    cin >> t;
    switch (t)
    {
    case 1:
      cin >> i >> j;
      box[j].insert(i);
      card[i].insert(j);
      break;
    case 2:
      cin >> i;
      for (auto x : box[i])
        cout << x << " ";
      cout << endl;
      break;
    case 3:
      cin >> i;
      for (auto x : card[i])
        cout << x << " ";
      cout << endl;
      break;
    }
  }
  return 0;
}