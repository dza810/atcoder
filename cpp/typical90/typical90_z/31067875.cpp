// Contest ID: typical90
// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
// Title: 026. Independent Set on a Tree（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-17 12:38:39 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31067875 ) 

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
vvi G(1000000, vi(0));
vi ans(1000000, 0);

void dfs(int v, int color) {
  if (ans[v] != 0)
    return;
  ans[v] = color;
  for (auto x : G[v])
    dfs(x, color * (-1));
}

int main() {
  cin >> N;
  rep(n, 0, N - 1) {
    int a, b;
    cin >> a >> b;
    a--;
    b--;
    G[a].push_back(b);
    G[b].push_back(a);
  }

  dfs(0, 1);
  int count = 0;
  rep(i, 0, N) if (ans[i] == 1) count++;

  int color = (count >= (N / 2)) ? 1 : -1;

  count = 0;
  rep(i, 0, N) {
    if (ans[i] == color) {
      if (count != 0)
        cout << " ";
      cout << (i + 1);
      count++;
      if (count >= N / 2)
        break;
    }
  }
  cout << endl;
  return 0;
}