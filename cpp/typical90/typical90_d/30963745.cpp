// Contest ID: typical90
// Problem ID: typical90_d ( https://atcoder.jp/contests/typical90/tasks/typical90_d )
// Title: 004. Cross Sum（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-14 11:05:41 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30963745 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const num INF = 2000000000;
const num mod = 1000000007;

int main() {
  int H, W;
  cin >> H >> W;

  vvi A(H, vi(W, 0));
  vi row(H, 0);
  vi column(W, 0);
  rep(i, 0, H) rep(j, 0, W) {
    int a;
    cin >> a;
    A[i][j] = a;
    row[i] += a;
    column[j] += a;
  }

  rep(i, 0, H) {
    int j = 0;
    cout << (row[i] + column[j] - A[i][j]);
    rep(j, 1, W) { cout << " " << (row[i] + column[j] - A[i][j]); }
    cout << endl;
  }

  return 0;
}