// Contest ID: typical90
// Problem ID: typical90_af ( https://atcoder.jp/contests/typical90/tasks/typical90_af )
// Title: 032. AtCoder Ekiden（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-28 14:28:00 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31327156 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = int;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  int N;
  vi ns(0);
  cin >> N;
  rep(i, 0, N) ns.push_back(i);

  vvi A(N, vi(N, 0));
  rep(i, 0, N) rep(j, 0, N) cin >> A[i][j];
  vvi No(N + 1, vi(N + 1, 0));

  int M;
  cin >> M;

  rep(i, 0, M) {
    int x, y;
    cin >> x >> y;
    x--; y--;
    No[x][y]++;
    No[y][x]++;
  }
  int ans = INT_MAX;
  do {
    int time = 0;
    rep(n, 0, N) {
      if (n < N - 1 && No[ns[n]][ns[n + 1]] > 0) {
        time = INT_MAX;
        break;
      }
      time += A[ns[n]][n];
    }
    ans = min(time, ans);
  } while (next_permutation(ns.begin(), ns.end()));

  cout << (ans == INT_MAX ? -1 : ans) << endl;
  return 0;
}
