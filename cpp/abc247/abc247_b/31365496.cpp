// Contest ID: abc247
// Problem ID: abc247_b ( https://atcoder.jp/contests/abc247/tasks/abc247_b )
// Title: B. Unique Nicknames
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-30 12:56:43 +0000 UTC ( https://atcoder.jp/contests/abc247/submissions/31365496 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  int N;
  cin >> N;
  vector<string> s(N);
  vector<string> t(N);
  map<string, int> m;
  bool flg = true;
  rep(i, 0, N) {
    cin >> s[i] >> t[i];
    m[s[i]]++;
    m[t[i]]++;
  }
  rep(i, 0, N) {
    if (m[s[i]] == 1 || m[t[i]] == 1)
      continue;
    if (s[i] == t[i] && m[s[i]] == 2)
      continue;
    flg = false;
    break;
  }
  cout << (flg ? "Yes" : "No") << endl;
  return 0;
}
