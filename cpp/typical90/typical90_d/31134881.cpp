// Contest ID: typical90
// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
// Title: 004. Cross Sum（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 12:05:00 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31134881 ) 

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
int H, W;
vvi A(2000, vi(2000, 0));
vi tate(2000, 0);
vi yoko(2000, 0);

int main() {
  cin >> H >> W;
  rep(i, 0, H) rep(j, 0, W) {
    cin >> A[i][j];
    tate[i] += A[i][j];
    yoko[j] += A[i][j];
  }

  rep(i, 0, H) {
    rep(j, 0, W) {
      if (j > 0)
        cout << " ";
      cout << (tate[i] + yoko[j] - A[i][j]);
    }
    cout << endl;
  }

  return 0;
}
