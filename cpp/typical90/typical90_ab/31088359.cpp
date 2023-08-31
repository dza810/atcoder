// Contest ID: typical90
// Problem ID: typical90_ab ( https://atcoder.jp/contests/typical90/tasks/typical90_ab )
// Title: 028. Cluttered Paper（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-18 14:39:21 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31088359 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int main() {
  int N;
  cin >> N;
  vvi G(1001, vi(1001, 0));

  rep(i, 0, N) {
    int lx, ly, rx, ry;
    cin >> lx >> ly >> rx >> ry;
    G[lx][ly]++;
    G[lx][ry]--;
    G[rx][ly]--;
    G[rx][ry]++;
  }

  rep(x, 0, 1001) {
    rep(y, 1, 1001) { G[x][y] += G[x][y - 1]; }
  }
  rep(x, 1, 1001) {
    rep(y, 0, 1001) { G[x][y] += G[x - 1][y]; }
  }
  vi ans(N + 1, 0);

  rep(x, 0, 1001) {
    rep(y, 0, 1001) { ans[G[x][y]]++; }
  }

  rep(i, 1, N + 1) { cout << ans[i] << endl; }

  return 0;
}