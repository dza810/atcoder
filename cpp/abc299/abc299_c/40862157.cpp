// Contest ID: abc299
// Problem ID: abc299_c ( https://atcoder.jp/contests/abc299/tasks/abc299_c )
// Title: C. Dango
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-22 12:48:35 +0000 UTC ( https://atcoder.jp/contests/abc299/submissions/40862157 ) 

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
  ll N;
  string S;
  cin >> N >> S;
  ll ans = 0;
  ll l = 0;
  ll r = 0;
  while (l < N)
  {
    while (r < N && S[r] == 'o')
      r++;
    while (l <= r && S[l] != '-')
      l++;
    chmax(ans, r - l);
    l = r;
    r++;
  }
  reverse(S.begin(), S.end());
  l = r = 0;
  while (l < N)
  {
    while (r < N && S[r] == 'o')
      r++;
    while (l <= r && S[l] != '-')
      l++;
    chmax(ans, r - l);
    l = r;
    r++;
  }
  cout << (ans == 1 ? -1 : ans - 1) << endl;
  return 0;
}