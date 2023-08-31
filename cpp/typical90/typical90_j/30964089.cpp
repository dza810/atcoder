// Contest ID: typical90
// Problem ID: typical90_j ( https://atcoder.jp/contests/typical90/tasks/typical90_j )
// Title: 010. Score Sum Queries（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-14 11:28:03 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30964089 ) 

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

int main() {
  int N;
  cin >> N;
  vi one(N + 1, 0);
  vi two(N + 1, 0);
  rep(i, 1, N + 1) {
    int c, p;
    cin >> c >> p;
    one[i] = one[i - 1];
    if (c == 1)
      one[i] += p;

    two[i] = two[i - 1];
    if (c == 2)
      two[i] += p;
  }

  int Q;
  cin >> Q;
  rep(i, 0, Q) {
    int l, r;
    cin >> l >> r;
    cout << (one[r] - one[l - 1]) << " " << (two[r] - two[l - 1]) << endl;
  }

  return 0;
}