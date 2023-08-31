// Contest ID: typical90
// Problem ID: typical90_j ( https://atcoder.jp/contests/typical90/tasks/typical90_j )
// Title: 010. Score Sum Queries（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 12:46:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31135712 ) 

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
int main() {
  int N;
  cin >> N;
  vi one(N + 1, 0);
  vi two(N + 1, 0);
  rep(i, 1, N + 1) {
    int c, p;
    cin >> c >> p;
    one[i] += one[i - 1];
    two[i] += two[i - 1];
    if (c == 1)
      one[i] += p;
    if (c == 2)
      two[i] += p;
  }
  int Q;
  cin >> Q;
  rep(i, 0, Q) {
    int l, r;
    cin >> l >> r;
    cout << one[r] - one[l - 1];
    cout << " ";
    cout << two[r] - two[l - 1];
    cout << endl;
  }
  return 0;
}
