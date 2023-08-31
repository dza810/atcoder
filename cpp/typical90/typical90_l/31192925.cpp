// Contest ID: typical90
// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
// Title: 012. Red Painting（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-23 12:34:44 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31192925 ) 

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

vi par(5000000, -1);
vi red(5000000, 0);

int H, W;

int root(int p) {
  if (par[p] == -1 || par[p] == p) {
    return p;
  }
  par[p] = root(par[p]);
  return par[p];
}

void con(int a, int b) {
  int x = root(a);
  int y = root(b);
  par[x] = y;
}

int same(int a, int b) { return root(a) == root(b); }

int v(int r, int c) { return (r + 2) * (W + 3) + (c + 2); }

int main() {
  // cout << "dgb" << endl;
  cin >> H >> W;
  int Q;
  cin >> Q;
  rep(i, 0, Q) {
    int t;
    cin >> t;
    if (t == 1) {
      int r, c;
      cin >> r >> c;
      int a = v(r, c);
      red[a] = 1;
      vi dr = {0, 1, 0, -1};
      vi dc = {1, 0, -1, 0};
      rep(i, 0, 4) {
        int b = v(r + dr[i], c + dc[i]);
        if (red[b] == 0)
          continue;
        con(a, b);
      }
    }
    if (t == 2) {
      int r, c;
      cin >> r >> c;
      int a = v(r, c);
      cin >> r >> c;
      int b = v(r, c);
      if (red[a] == 1 && red[b] == 1) {
        if (same(a, b)) {
          cout << "Yes" << endl;
          continue;
        }
      }
      cout << "No" << endl;
    }
  }
  return 0;
}
