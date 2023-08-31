// Contest ID: abc294
// Problem ID: abc294_e ( https://atcoder.jp/contests/abc294/tasks/abc294_e )
// Title: E. 2xN Grid
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-03-27 01:17:53 +0000 UTC ( https://atcoder.jp/contests/abc294/submissions/40089970 ) 

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
  ll l, n1, n2;
  cin >> l >> n1 >> n2;
  vi v1(n1);
  vi l1(n1);
  vi v2(n2);
  vi l2(n2);
  rep(i, n1) cin >> v1[i] >> l1[i];
  rep(i, n2) cin >> v2[i] >> l2[i];

  ll i1 = 0;
  ll c1 = 0;
  ll i2 = 0;
  ll c2 = 0;

  ll ans = 0;
  while (c1 < l && c2 < l)
  {
    if (v1[i1] == v2[i2])
    {
      ans += min(c1 + l1[i1], c2 + l2[i2]) - max(c1, c2);
    }

    if (c1 + l1[i1] < c2 + l2[i2])
    {
      c1 += l1[i1];
      i1++;
    }
    else if (c1 + l1[i1] > c2 + l2[i2])
    {
      c2 += l2[i2];
      i2++;
    }
    else{
      c1 += l1[i1];
      c2 += l2[i2];
      i1++;
      i2++;
    }
   
  }

  cout << ans << endl;

  return 0;
}