// Contest ID: typical90
// Problem ID: typical90_af ( https://atcoder.jp/contests/typical90/tasks/typical90_af )
// Title: 032. AtCoder Ekiden（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-19 12:19:57 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31102015 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  int N;
  cin >> N;
  vvi A(N, vi(N, 0));
  vvi K(N, vi(N, 0));
  rep(i, 0, N) rep(j, 0, N) cin >> A[i][j];
  int M;
  cin >> M;
  rep(i, 0, M) {
    int x, y;
    cin >> x >> y;
    x--;
    y--;
    K[x][y] = 1;
    K[y][x] = 1;
  }

  vi v(N);
  iota(v.begin(), v.end(), 0);
  int min_time = INF;
  do {
    int time = A[v[0]][0];
    bool flg = false;
    rep(i, 1, N) {
      if (K[v[i]][v[i - 1]] == 1) {
        flg = true;
        break;
      }
      time += A[v[i]][i];
    }
    if (flg)
      continue;
    min_time = min(time, min_time);
  } while (std::next_permutation(v.begin(), v.end()));
  cout << ((min_time >= INF) ? -1 : min_time) << endl;

  return 0;
}