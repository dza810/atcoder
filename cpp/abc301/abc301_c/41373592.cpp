// Contest ID: abc301
// Problem ID: abc301_c ( https://atcoder.jp/contests/abc301/tasks/abc301_c )
// Title: C. AtCoder Cards
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-05-13 12:51:32 +0000 UTC ( https://atcoder.jp/contests/abc301/submissions/41373592 ) 

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
  string S, T;
  cin >> S >> T;

  map<char, ll> ss;
  map<char, ll> tt;
  for (auto s : S)
    ss[s]++;
  for (auto t : T)
    tt[t]++;
  bool ans = true;
  for (auto x : "bfghijklmnpqsuvwxyz")
  {
    ans = ans && ss[x] == tt[x];
  }

  ll ps = 0;
  ll pt = 0;
  if (ans)
    for (auto x : "atcoder")
    {
      ll diff = ss[x] - tt[x];
      if (diff > 0)
        pt += diff;
      else
        ps -= diff;
    }
  ans = ans && (tt['@'] >= pt && ss['@'] >= ps && ss['@'] - ps == tt['@'] - pt);

  cout << (ans ? "Yes" : "No") << endl;

  return 0;
}