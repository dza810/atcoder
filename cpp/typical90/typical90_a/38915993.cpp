// Contest ID: typical90
// Problem ID: typical90_a ( https://atcoder.jp/contests/typical90/tasks/typical90_a )
// Title: 001. Yokan Party（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-16 01:27:22 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/38915993 ) 

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

ll n, len, k;
ll a[100010];

int main()
{
  fastio;
  cin >> n >> len >> k;
  rep(i, n) cin >> a[i];
  ll l = -1;
  ll r = len+1;
  ll c;
  while (abs(r - l) > 1)
  {
    c = (r - l) / 2 + l;
    ll cut = 0;
    int cnt = 0;
    rep(i, n)
    {
      if (a[i] - cut >= c && len - a[i] >= c)
      {
        cnt++;
        cut = a[i];
      }
    }
    if (cnt >= k)
      l = c;
    else
      r = c;
  }
  cout << l << endl;

  return 0;
}