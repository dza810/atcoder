// Contest ID: abs
// Problem ID: arc089_a ( https://atcoder.jp/contests/abs/tasks/arc089_a )
// Title: 
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 13:04:20 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/38907830 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;
#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF (1 << 20)
#define INFL (1LL << 60)
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
#define repp(i, start, end) for (int i = start; i <= end; i++)
#define repp_rev(i, start, end) for (int i = start; i >= end; i--)
#define sz(x) (int)x.size()
#define chmax(x, y) x = max((x), (y))
#define chmin(x, y) x = min((x), (y))
// const pair<int, int> INF2 = {INF, INF};
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<bool>> vvb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;
template <typename T, typename S>
pair<T, S> operator+(pair<T, S> x, pair<T, S> y)
{
  T t = x.first + y.first;
  S s = x.second + y.second;
  return {t, s};
}

ll n;
ll t[110000];
ll x[110000];
ll y[110000];

int main()
{
  fastio;
  cin >> n;
  t[0] = x[0] = y[0] = 0LL;
  repp(i, 1, n) cin >> t[i] >> x[i] >> y[i];
  ll len;
  ll dt;
  rep(i, n)
  {
    len = abs(x[i + 1] - x[i]) + abs(y[i + 1] - y[i]);
    dt = t[i + 1] - t[i];
    if (dt >= len && (dt - len) % 2LL == 0LL)
      continue;
    cout << "No" << endl;
    return 0;
  }
  cout << "Yes" << endl;
  return 0;
}