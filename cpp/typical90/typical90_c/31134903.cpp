// Contest ID: typical90
// Problem ID: typical90_c ( https://atcoder.jp/contests/typical90/tasks/typical90_c )
// Title: 003. Longest Circular Road（★4）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 12:06:06 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31134903 ) 

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
int N;
vvi G(100001);

vi dist(int s) {
  vi d(N, -1);
  queue<int> Q;
  Q.push(s);
  d[s] = 0;
  while (!Q.empty()) {
    int q = Q.front();
    Q.pop();
    for (auto v : G[q]) {
      if (d[v] == -1) {
        d[v] = 1 + d[q];
        Q.push(v);
      }
    }
  }
  return d;
}

int main() {
  cin >> N;
  rep(i, 0, N - 1) {
    int a, b;
    cin >> a >> b;
    a--; b--;
    G[a].push_back(b);
    G[b].push_back(a);
  }

  vi d = dist(0);
  int max_v = 0;
  rep(i, 0, N) {
    if (d[max_v] < d[i]) {
      max_v = i;
    }
  }

  d = dist(max_v);
  rep(i, 0, N) {
    if (d[max_v] < d[i]) {
      max_v = i;
    }
  }

  cout << d[max_v]+1 << endl;
  return 0;
}
