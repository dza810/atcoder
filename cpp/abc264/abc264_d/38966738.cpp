// Contest ID: abc264
// Problem ID: abc264_d ( https://atcoder.jp/contests/abc264/tasks/abc264_d )
// Title: D. "redocta".swap(i,i+1)
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-18 11:31:34 +0000 UTC ( https://atcoder.jp/contests/abc264/submissions/38966738 ) 

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
ll ans = 0;
char atcoder_[8] = "atcoder";

void swap(ll i, ll j)
{
  assert(j >= i);
  if (j - i == 0)
    return;
  if (j - i == 1)
  {
    ans++;
    char tmp = s[i];
    s[i] = s[j];
    s[j] = tmp;
    return;
  }
  if (j - i > 1)
  {
    swap(j - 1, j);
    swap(i, j - 1);
    return;
  }
}

void calc(ll i)
{
  rep(j, 7)
  {
    if (atcoder_[i] == s[j])
    {
      swap(i, j);
      break;
    }
  }
}

int main()
{
  fastio;
  rep(i, 7)
  {
    cin >> s[i];
  }
  rep(i, 7)
      calc(i);

  cout << ans << endl;

  return 0;
}