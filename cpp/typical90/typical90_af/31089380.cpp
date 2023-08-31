// Contest ID: typical90
// Problem ID: typical90_af ( https://atcoder.jp/contests/typical90/tasks/typical90_af )
// Title: 032. AtCoder Ekiden（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-18 15:52:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31089380 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
// const int INF = 1 << 30;
const ll INF = 1LL << 59;

int main() {
  ll N;
  cin >> N;
  vvi A(N, vi(N, 0));
  rep(i, 0, N) rep(j, 0, N) cin >> A[i][j];
  ll M;
  cin >> M;
  vvi P(N, vi(N, 0));
  rep(i, 0, M) {
    ll X, Y;
    cin >> X >> Y;
    X--;
    Y--;
    P[X][Y] = 1;
    P[Y][X] = 1;
  }
  vvvi dp((1 << N), vvi(N, vi(N, INF)));

  rep(i, 0, N) dp[(1 << i)][i][0] = A[i][0];

  rep(j, 1, N) {            // section // 10 -> 100000~10**5
    rep(k, 0, N) {          // 10 -> 10**6
      rep(i, 0, N) {        // person // 10
        rep(p, 0, 1 << N) { // person // 10
          if (i == k)
            continue;
          if (P[i][k] == 1)
            continue;
          if ((p & (1 << i)) != 0)
            continue;
          dp[p | (1 << i)][i][j] =
              min(dp[p | (1 << i)][i][j], dp[p][k][j - 1] + A[i][j]);
        }
      }
    }
  }
  ll ans = INF;
  rep(i, 0, N) { ans = min(ans, dp[(1 << N) - 1][i][N - 1]); }

  cout << ((ans < INF) ? ans : -1) << endl;

  return 0;
}