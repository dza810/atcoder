// Contest ID: abc249
// Problem ID: abc249_d ( https://atcoder.jp/contests/abc249/tasks/abc249_d )
// Title: D. Index Trio
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-23 13:46:31 +0000 UTC ( https://atcoder.jp/contests/abc249/submissions/31211022 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int MOD = 1'000'000'007;
const int INF = 1 << 30;
int N;
vi A(200'001, 0);
vi B(200'001, 0);

int main() {
  cin >> N;
  rep(i, 0, N) cin >> A[i];
  rep(i, 0, N) B[A[i]]++;
  ll cnt = 0LL;
  rep(aj, 1, 448) {
    if (B[aj] == 0)
      continue;
    cnt += B[aj] * B[aj] * B[aj * aj];
    rep(ak, aj + 1, 200'001) {
      if (aj * ak > 200'000)
        break;
      cnt += 2 * B[aj] * B[ak] * B[aj * ak];
    }
  }
  cout << cnt << endl;
  return 0;
}
