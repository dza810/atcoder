// Contest ID: abc301
// Problem ID: abc301_a ( https://atcoder.jp/contests/abc301/tasks/abc301_a )
// Title: A. Overall Winner
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-05-13 12:22:21 +0000 UTC ( https://atcoder.jp/contests/abc301/submissions/41360136 ) 

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
  ll takahashi = 0;
  ll takahashi_i = 0;
  ll aoki = 0;
  ll aoki_i = 0;

  rep(i, N) {
    if (S[i] == 'T')
      takahashi++, takahashi_i=i;
    if (S[i] == 'A')
      aoki++, aoki_i = i;
  }
  if(takahashi > aoki) cout << "T" << endl;
  else if(takahashi < aoki) cout << "A" << endl;
  else cout << (takahashi_i < aoki_i ? "T" : "A") << endl;
  return 0;
}