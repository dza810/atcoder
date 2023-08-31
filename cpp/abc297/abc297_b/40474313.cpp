// Contest ID: abc297
// Problem ID: abc297_b ( https://atcoder.jp/contests/abc297/tasks/abc297_b )
// Title: B. chess960
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-09 12:30:30 +0000 UTC ( https://atcoder.jp/contests/abc297/submissions/40474313 ) 

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

map<char, vi> s;

int main()
{
  fastio;
  s.insert(pair('K', vi(0)));
  s.insert(pair('Q', vi(0)));
  s.insert(pair('R', vi(0)));
  s.insert(pair('B', vi(0)));
  s.insert(pair('N', vi(0)));
  rep(i, 8)
  {
    char x;
    cin >> x;
    s[x].pb(i + 1);
  }
  bool ans = true;
  ans = ans && (s['B'][0] % 2 != s['B'][1] % 2);
  ans = ans && s['R'][0] < s['K'][0] && s['K'][0] < s['R'][1];
  cout << ((ans) ? "Yes" : "No") << endl;
  return 0;
}