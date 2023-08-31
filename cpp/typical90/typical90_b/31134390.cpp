// Contest ID: typical90
// Problem ID: typical90_b ( https://atcoder.jp/contests/typical90/tasks/typical90_b )
// Title: 002. Encyclopedia of Parentheses（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 11:36:50 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31134390 ) 

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

void make(string prev, int n0, int n1, int depth) {
  if (n0 + n1 == N) {
    if (depth == 0)
      cout << prev << endl;
    return;
  }
  if (n0 < N / 2)
    make(prev + "(", n0, n1 + 1, depth + 1);
  if (depth > 0)
    make(prev + ")", n0, n1 + 1, depth - 1);
}

int main() {
  cin >> N;
  if (N % 2 == 1)
    return 0;
  make("", 0, 0, 0);

  return 0;
}
