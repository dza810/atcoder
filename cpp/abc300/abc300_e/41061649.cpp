// Contest ID: abc300
// Problem ID: abc300_e ( https://atcoder.jp/contests/abc300/tasks/abc300_e )
// Title: E. Dice Product 3
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-04-29 23:36:47 +0000 UTC ( https://atcoder.jp/contests/abc300/submissions/41061649 ) 

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

using mint = atcoder::modint998244353;
ll N;
map<ll, mint> cache;

mint f(ll x)
{
  if (x > N)
  {
    return 0;
  }
  if (x == N)
  {
    return 1;
  }
  if (cache.count(x))
    return cache[x];
  mint ans = 0;
  repp(i, 2, 6)
  {
    ans += f(i * x);
  }
  ans /= 5;
  cache[x] = ans;
  return ans;
}

int main()
{
  fastio;
  cin >> N;
  cout << f(1).val() << endl;
  return 0;
}