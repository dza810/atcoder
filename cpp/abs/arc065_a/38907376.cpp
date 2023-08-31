// Contest ID: abs
// Problem ID: arc065_a ( https://atcoder.jp/contests/abs/tasks/arc065_a )
// Title: 
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 12:46:48 +0000 UTC ( https://atcoder.jp/contests/abs/submissions/38907376 ) 

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

int main()
{
  fastio;
  string s;
  cin >> s;
  reverse(all(s));
  ll len_s = sz(s);
  ll i = 0;
  while (i < len_s)
  {
    if (s.substr(i, 5) == "maerd")
      i += 5;
    else if (s.substr(i, 7) == "remaerd")
      i += 7;
    else if (s.substr(i, 5) == "esare")
      i += 5;
    else if (s.substr(i, 6) == "resare")
      i += 6;
    else
      break;
  }

  cout << ((i == len_s) ? "YES" : "NO") << endl;
  return 0;
}