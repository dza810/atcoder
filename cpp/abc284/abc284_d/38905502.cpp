// Contest ID: abc284
// Problem ID: abc284_d ( https://atcoder.jp/contests/abc284/tasks/abc284_d )
// Title: D. Happy New Year 2023 
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 11:31:42 +0000 UTC ( https://atcoder.jp/contests/abc284/submissions/38905502 ) 

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
ll t;
int main()
{
  fastio;
  cin >> t;
  rep(_, t)
  {
    ll n;
    ll p;
    ll q;
    cin >> n;
    ll i = 2LL;
    while (i * i <= n)
    {
      if (n % i == 0)
      {
        if (n % (i * i) == 0)
        {
          p = i;
          q = n / i / i;
        }
        else
        {
          q = i;
          p = (ll)sqrt((n / i));
        }
        break;
      }
      i++;
    }
    cout << p << " " << q << endl;
  }
  return 0;
}