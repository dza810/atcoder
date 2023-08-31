// Contest ID: typical90
// Problem ID: typical90_z ( https://atcoder.jp/contests/typical90/tasks/typical90_z )
// Title: 026. Independent Set on a Tree（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-28 13:37:05 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31326177 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;
vvi G(100'100, vi());
int N;
vi color(100'100, 0);

void dfs(int v, int c) {
  color[v] = c;
  for (auto vv : G[v])
    if (color[vv] == 0)
      dfs(vv, -c);
}

int main() {
  cin >> N;
  rep(i, 0, N-1) {
    int a, b;
    cin >> a >> b;
    G[a].push_back(b);
    G[b].push_back(a);
  }
  int c = 1;
  dfs(1, c);
  int count = 0;
  rep(i, 1, N+1) if (color[i] == c) count++;

  if (count < N / 2) {
    c *= -1;
  }
  count = 0;
  rep(i, 1, N+1) {
    if (color[i] == c) cout << (count++ != 0 ? " " : "") << i;
    if(count >= N/2) break;
  }
  cout << endl;

  return 0;
}
