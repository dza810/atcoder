// Contest ID: typical90
// Problem ID: typical90_r ( https://atcoder.jp/contests/typical90/tasks/typical90_r )
// Title: 018. Statue of Chokudai（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-16 03:51:59 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30993652 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

double T, L, X, Y, Q;

int main() {
  cin >> T >> L >> X >> Y >> Q;
  cout << setprecision(10);
  rep(q, 0, Q) {
    double y, z, e;
    cin >> e;
    y = (-L / 2.0) * sin(2.0 * M_PI * (e / T));
    z = (L / 2.0) * (1.0 - cos(2.0 * M_PI * (e / T)));

    cout << 180.0 / M_PI * atan2(z, sqrt((y - Y) * (y - Y) + X * X)) << endl;

  }
  return 0;
}