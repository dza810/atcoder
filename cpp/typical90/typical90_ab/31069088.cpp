// Contest ID: typical90
// Problem ID: typical90_ab ( https://atcoder.jp/contests/typical90/tasks/typical90_ab )
// Title: 028. Cluttered Paper（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-17 13:31:48 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31069088 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int N;
vvi g(1001, vi(1001, 0));
int main() {
  int N;
  cin >> N;
  rep(i, 0, N) {
    int lx, ly, rx, ry;
    cin >> lx >> ly >> rx >> ry;
    g[lx][ly]++;
    g[lx][ry]--;
    g[rx][ly]--;
    g[rx][ry]++;
  }
  rep(y, 0, 1001) rep(x, 1, 1001) g[x][y] += g[x - 1][y];

  rep(x, 0, 1001) rep(y, 1, 1001) g[x][y] += g[x][y - 1];

  vi ans(N + 1, 0);
  rep(x, 0, 1001) {
    rep(y, 0, 1001) { ans[g[x][y]]++; }
  }
  rep(i, 1, N + 1) cout << ans[i] << endl;

  return 0;
}