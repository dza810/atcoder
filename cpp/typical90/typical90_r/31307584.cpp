// Contest ID: typical90
// Problem ID: typical90_r ( https://atcoder.jp/contests/typical90/tasks/typical90_r )
// Title: 018. Statue of Chokudai（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-27 13:50:38 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31307584 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  double T, L, X, Y, Q;
  cin >> T >> L >> X >> Y >> Q;
  rep(q, 0, Q) {
    double E;
    cin >> E;
    double y = -0.5 * (double)L * sin(2.0 * M_PI * (double)E / (double)T);
    double z = 0.5 * (double)L * (1 - cos(2.0 * M_PI * (double)E / (double)T));
    double dy = Y - y;
    // cout << setprecision(20) << atan2(z, sqrt(X * X + dy * dy)) * 180.0 / M_PI << endl;
    double ans = atan2(z, sqrt(X * X + dy * dy)) * 180.0 / M_PI;
    printf("%0.10f\n", ans);
  }

  return 0;
}
