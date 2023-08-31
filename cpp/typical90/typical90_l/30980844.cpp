// Contest ID: typical90
// Problem ID: typical90_l ( https://atcoder.jp/contests/typical90/tasks/typical90_l )
// Title: 012. Red Painting（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 09:19:11 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30980844 ) 

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

num H, W, Q;

class UnionFind {
public:
  vi par;

  void init(int size) { par.resize(size, -1); }

  int root(int pos) {
    if (par[pos] == -1)
      return pos;
    par[pos] = root(par[pos]);
    return root(par[pos]);
  }
  void unite(int u, int v) {
    u = root(u);
    v = root(v);
    if (u == v)
      return;
    par[u] = v;
  }
  bool same(int u, int v) { return (root(u) == root(v)); }
};

int vnum(int r, int c) { return (r - 1) * W + (c - 1); }

void query1(UnionFind &G, vector<vector<bool>> &red, int r, int c) {
  red[r][c] = true;
  for (int dr : {1, -1}) {
    if (1 <= r + dr && r + dr <= H)
      if (red[r + dr][c]) {
        G.unite(vnum(r, c), vnum(r + dr, c));
      }
  }
  for (int dc : {1, -1}) {
    if (1 <= c + dc && c + dc <= W)
      if (red[r][c + dc]) {
        G.unite(vnum(r, c), vnum(r, c + dc));
      }
  }
}

bool query2(UnionFind &G, vector<vector<bool>> &red, int ra, int ca, int rb,
            int cb) {
  if ((!red[ra][ca]) | (!red[rb][cb]))
    return false;
  if (G.same(vnum(ra, ca), vnum(rb, cb))) {
    return true;
  };
  return false;
}

int main() {
  cin >> H >> W >> Q;
  UnionFind G;

  vector<vector<bool>> red(H + 1, vector<bool>(W + 1, false));
  G.init(H * W);
  rep(q, 0, Q) {
    int t;
    cin >> t;
    if (t == 1) {
      int r, c;
      cin >> r >> c;
      query1(G, red, r, c);
      continue;
    }
    if (t == 2) {
      int ra, ca, rb, cb;
      cin >> ra >> ca >> rb >> cb;
      cout << (query2(G, red, ra, ca, rb, cb) ? "Yes" : "No") << endl;
      continue;
    }
  }

  return 0;
}