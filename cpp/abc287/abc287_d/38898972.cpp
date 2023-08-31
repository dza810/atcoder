// Contest ID: abc287
// Problem ID: abc287_d ( https://atcoder.jp/contests/abc287/tasks/abc287_d )
// Title: D. Match or Not
// Language: C++ (GCC 9.2.1)
// Submitted: 2023-02-15 04:15:53 +0000 UTC ( https://atcoder.jp/contests/abc287/submissions/38898972 ) 

#include <bits/stdc++.h>
#include <atcoder/all>
using namespace std;

#define MOD 1000000007
#define mod(x, m) (((x % m) + m) % m)
#define pb push_back
#define endl "\n"
#define INF 1 << 30
#define INFL 1 << 60
#define fastio ios_base::sync_with_stdio(false), cin.tie(nullptr)
#define all(x) x.begin(), x.end()
#define rep(i, end) for (int i = 0; i < end; i++)
#define repp(i, start, end) for (int i = start; i <= end; i++)
#define sz(x) (int)x.size()
typedef long long ll;
typedef vector<int> vi;
typedef vector<bool> vb;
typedef vector<vector<int>> vvi;
typedef pair<int, int> pi;

string s;
string t;

int main()
{
  // input
  fastio;
  cin >> s >> t;

  // calc
  int len_t = sz(t);
  int len_s = sz(s);
  vb pre(len_t + 1, true);
  vb suf(len_t + 1, true);

  repp(i, 1, len_t)
  {
    pre[i] = pre[i - 1] && (s[i - 1] == '?' || t[i - 1] == '?' || s[i - 1] == t[i - 1]);
    suf[i] = suf[i - 1] && (s[len_s - i] == '?' || t[len_t - i] == '?' || s[len_s - i] == t[len_t - i]);
  }
  // output
  rep(i, len_t + 1)
  {
    cout << ((pre[i] && suf[len_t - i]) ? "Yes" : "No") << endl;
  }

  return 0;
}