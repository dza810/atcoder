// Contest ID: abc264
// Problem ID: abc264_d ( https://atcoder.jp/contests/abc264/tasks/abc264_d )
// Title: D. "redocta".swap(i,i+1)
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-18 11:24:36 +0000 UTC ( https://atcoder.jp/contests/abc264/submissions/38966584 ) 

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

char s[7];
char si[7];
char atcoder_[8] = "atcoder";

int main()
{
  fastio;
  rep(i, 7)
  {
    cin >> s[i];
  }
  ll cnt = 0;
  repp(i, 0, 6)
  {
    ll ii = 0;
    rep(j, 7)
    {
      if (s[i] == atcoder_[j])
      {
        ii = j;
        break;
      }
    } // j

    repp(iii, i + 1, 6)
    {
      repp(j, 0, ii - 1)
      {
        if (s[iii] == atcoder_[j])
          cnt++;
      }
    }
  }
  cout << cnt << endl;

  return 0;
}