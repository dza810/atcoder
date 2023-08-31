// Contest ID: typical90
// Problem ID: typical90_r ( https://atcoder.jp/contests/typical90/tasks/typical90_r )
// Title: 018. Statue of Chokudai（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 10:52:27 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30982402 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 60;

ll T, L, X, Y, Q;
vi E(2000, 0);

int main() {
  cin >> T >> L >> X >> Y >> Q;

  rep(q, 0, Q) {
    double y, z;
    ll E;
    cin >> E;
    y = (double)L / 2.0 * (-1.0) * sin(2.0 * M_PI * (double)E / (double)T);
    z = (double)L / 2.0 -
        (double)L / 2.0 * cos(2.0 * M_PI * (double)E / (double)T);
    cout << std::fixed << std::setprecision(12) << atan2(z, sqrt(X * X + (y - Y) * (y - Y))) * 180.0 / M_PI << endl;
  }

  return 0;
}