// Contest ID: typical90
// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
// Title: 004. Cross Sum（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 11:36:54 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30947635 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
#define INF 999999999

int main() {
  num H, W;

  cin >> H >> W;
  vvi A(H, vi(W, 0));
  vi yoko(H, 0);
  vi tate(W, 0);

  rep(i, 0, H) rep(j, 0, W) cin >> A[i][j];

  rep(i, 0, H) rep(j, 0, W) yoko[i] += A[i][j];

  rep(j, 0, W) rep(i, 0, H) tate[j] += A[i][j];

  rep(i, 0, H) {
    rep(j, 0, W - 1) {
      cout << (tate[j] + yoko[i] - A[i][j]) << " ";
    }
    int j = W - 1;
    cout << (tate[j] + yoko[i] - A[i][j]) << endl;
  }

  return 0;
}