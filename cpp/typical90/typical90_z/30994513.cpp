// Contest ID: typical90
// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
// Title: 026. Independent Set on a Tree（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-16 04:58:24 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30994513 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

ll N;
vvi G(2000002, vi(0));
vi color(2000002, 0L);

void dfs(int pos, int col) {
  if (color[pos] != 0)
    return;
  color[pos] = col;
  for (auto v : G[pos]) {
    dfs(v, col * -1);
  }
}

int main() {
  cin >> N;
  rep(i, 0, N-1) {
    int a, b;
    cin >> a >> b;
    a--;
    b--;
    G[a].push_back(b);
    G[b].push_back(a);
  }
  dfs(0, 1);

  int count = 0;
  rep(i, 0, N) if (color[i] == 1) count++;

  int col = (count >= N / 2) ? 1 : -1;
  count = 0;
  int i = 0;

  while (count < N / 2 && i < N) {
    if (color[i] == col) {
      if (count != 0)
        cout << " ";
      cout << (i + 1);
      count++;
    }
    i++;
  }
  cout << endl;
  return 0;
}