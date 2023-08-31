// Contest ID: abc301
// Problem ID: abc301_b ( https://atcoder.jp/contests/abc301/tasks/abc301_b )
// Title: B.  Fill the Gaps
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-05-13 12:37:03 +0000 UTC ( https://atcoder.jp/contests/abc301/submissions/41367660 ) 

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
  ll N;
  ll A[110];
  cin >> N;
  rep(i, N) cin >> A[i];
  rep(i, N - 1)
  {
    if (A[i] <= A[i + 1])
      repp(j, A[i], A[i + 1]-1) cout << j << " ";
    if (A[i] > A[i + 1])
      repp_rev(j, A[i], A[i+1]+1) cout << j << " ";
  }
  cout << A[N-1] << endl;

  return 0;
}
