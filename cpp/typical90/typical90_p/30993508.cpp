// Contest ID: typical90
// Problem ID: typical90_p ( https://atcoder.jp/contests/typical90/tasks/typical90_p )
// Title: 016. Minimum Coins（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-16 03:41:29 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30993508 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

ll A, B, C, N;

int main() {
  cin >> N >> A >> B >> C;
  num ans = INF;
  rep(a, 0, 10000LL) {
    rep(b, 0, 10000LL - a) {
      num Nc = N - A * a - B * b;
      if ((Nc >= 0LL) && (Nc % C == 0LL)) {
        num c = Nc / C;
        if ((0 <= a + b + c) && (a + b + c < 10000LL)) {
          ans = min(ans, a + b + c);
        }
      }
    }
  }
  cout << ans << endl;
  return 0;
}