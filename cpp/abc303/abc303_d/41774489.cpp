// Contest ID: abc303
// Problem ID: abc303_d ( https://atcoder.jp/contests/abc303/tasks/abc303_d )
// Title: D. Shift vs. CapsLock
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-05-27 13:41:43 +0000 UTC ( https://atcoder.jp/contests/abc303/submissions/41774489 ) 

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
  ll X,Y,Z;
  string S;
  cin >> X >> Y >> Z;
  cin >> S;
  vector<pair<char, ll>> ss(0);
  for (auto s: S){
    if (ss.size() > 0 && ss[ss.size() - 1].first == s)
      ss[ss.size() - 1].second++;
    else ss.push_back({s, 1});
  }

  ll dp[2] = {0, Z};
  ll prev_dp[2] = {0, Z};
  for(auto [c, n] : ss){
    if (c == 'a')
    {
      dp[0] = min(min(prev_dp[0] + X * n, prev_dp[1] + Y * n + Z), prev_dp[1] + Z + X * n);
      dp[1] = min(min(prev_dp[1] + Y * n, prev_dp[0] + X * n + Z), prev_dp[0] + Z + Y * n);
    }
    else if (c == 'A')
    {
      dp[0] = min(min(prev_dp[0] + Y * n, prev_dp[1] + X * n + Z), prev_dp[1] + Z + Y * n);
      dp[1] = min(min(prev_dp[1] + X * n, prev_dp[0] + Y * n + Z), prev_dp[0] + Z + X * n);
    }
    prev_dp[0] = dp[0];
    prev_dp[1] = dp[1];
  }

  cout << min(dp[0], dp[1]) << endl;
  
  return 0;
}