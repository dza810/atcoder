// Contest ID: abc249
// Problem ID: abc249_c ( https://atcoder.jp/contests/abc249/tasks/abc249_c )
// Title: C. Just K
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-23 13:15:43 +0000 UTC ( https://atcoder.jp/contests/abc249/submissions/31204004 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int MOD = 1'000'000'007;
const int INF = 1 << 30;

int main() {
  int N;
  int K;
  cin >> N >> K;
  vector<string> S(N);
  rep(i, 0, N) cin >> S[i];
  int ans = 0;
  rep(i, 0, 1 << N) {
    vi count(28, 0);
    vi chars(16, 0);
    rep(j, 0, 15) {
      if ((i & (1 << j)) != 0) {
        for (auto c : S[j]) {
          count[(int)(c - 'a')]++;
        }
      }
    }
    rep(j, 0, 28) { chars[count[j]]++; }
    ans = max(ans, chars[K]);
  }
  cout << ans << endl;
  return 0;
}
