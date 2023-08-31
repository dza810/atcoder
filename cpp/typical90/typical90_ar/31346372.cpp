// Contest ID: typical90
// Problem ID: typical90_ar ( https://atcoder.jp/contests/typical90/tasks/typical90_ar )
// Title: 044. Shift and Swapping（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-29 13:37:48 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31346372 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = int;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int N, Q;

int v(int i){
  return ((i%N)+N)%N;
}

int main() {
  cin >> N >> Q;
  vi A(N, 0);
  rep(i, 0, N) cin >> A[i];

  int shft = 0;
  rep(q, 0, Q) {
    int t, x, y;
    cin >> t >> x >> y;
    x--;
    y--;
    if (t == 1) {
      swap(A[v(x + shft)], A[v(y + shft)]);
    }
    if (t == 2) {
      shft--;
    }
    if (t == 3) {
      cout << A[v(x + shft)] << endl;
    }
  }
  return 0;
}
