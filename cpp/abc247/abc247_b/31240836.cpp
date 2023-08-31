// Contest ID: abc247
// Problem ID: abc247_b ( https://atcoder.jp/contests/abc247/tasks/abc247_b )
// Title: B. Unique Nicknames
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-24 12:51:46 +0000 UTC ( https://atcoder.jp/contests/abc247/submissions/31240836 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  int N;
  cin >> N;
  vector<string> S(N);
  vector<string> T(N);
  map<string, int> m;
  rep(i, 0, N) {
    cin >> S[i] >> T[i];
    m[S[i]]++;
    if (S[i] != T[i])
      m[T[i]]++;
  }
  bool flg = true;
  rep(i, 0, N) {
    if (m[S[i]] == 1 || m[T[i]] == 1)
      continue;
    flg = false;
    break;
  }
  cout << (flg ? "Yes" : "No") << endl;
  return 0;
}
