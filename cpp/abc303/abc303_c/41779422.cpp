// Contest ID: abc303
// Problem ID: abc303_c ( https://atcoder.jp/contests/abc303/tasks/abc303_c )
// Title: C. Dash
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-05-27 14:45:38 +0000 UTC ( https://atcoder.jp/contests/abc303/submissions/41779422 ) 

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

ll ans = 0LL;

ll dx[4] = {1, -1, 0, 0};
ll dy[4] = {0, 0, 1, -1};
string RLUD = "RLUD";

int main()
{
  fastio;
  ll N, M, H, K;
  string S;
  cin >> N >> M >> H >> K >> S;
  set<pair<ll, ll>> heal;

  rep(i, M)
  {
    ll x, y;
    cin >> x >> y;
    heal.insert({x,y});
  }

  ll xx = 0;
  ll yy = 0;
  ll h = H;
  rep(i, N)
  {
    ll d = RLUD.find(S[i]);
    xx += dx[d];
    yy += dy[d];
    h--;
    if (h < 0)
    {
      cout << "No" << endl;
      return 0;
    }
    if (h < K && heal.count({xx,yy}) > 0)
    {
      heal.erase({xx, yy});
      h = K;
    }
    
  }
  cout << "Yes" << endl;
  return 0;
}