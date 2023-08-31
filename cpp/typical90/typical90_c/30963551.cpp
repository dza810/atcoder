// Contest ID: typical90
// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
// Title: 003. Longest Circular Road（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-14 10:50:47 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30963551 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const num INF = 2000000000;
const num mod = 1000000007;

vi tree_dist(int N, const vvi G, int start) {
  vi dist(N, INF);
  dist[start] = 0;
  queue<int> Q;
  Q.push(start);
  while (!Q.empty()) {
    int from = Q.front();
    Q.pop();
    for (auto to : G[from]) {
      if (dist[to] != INF)
        continue;
      dist[to] = dist[from] + 1;
      Q.push(to);
    }
  }
  return dist;
}

int main() {
  int N = 0;

  cin >> N;
  vvi G(N, vi(0));

  rep(i, 0, N - 1) {
    int a, b;
    cin >> a >> b;
    a--;
    b--;
    G[a].push_back(b);
    G[b].push_back(a);
  }

  vi dist = tree_dist(N, G, 0);

  int farthest = 0;
  rep(i, 0, N) {
    if (dist[farthest] < dist[i])
      farthest = i;
  }

  dist = tree_dist(N, G, farthest);

  rep(i, 0, N) {
    if (dist[farthest] < dist[i])
      farthest = i;
  }
  cout << dist[farthest] + 1 << endl;

  return 0;
}