// Contest ID: typical90
// Problem ID: typical90_g ( https://atcoder.jp/contests/typical90/tasks/typical90_g )
// Title: 007. CP Classes（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-13 12:31:40 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30948611 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<num, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const num INF = 2000000000;

int main() {
  num N;
  cin >> N;
  vi A(N, 0);
  rep(n, 0, N) cin >> A[n];
  sort(A.begin(), A.end());
  num Q;
  cin >> Q;
  vi B(Q, 0);
  rep(q, 0, Q) cin >> B[q];

  rep(q, 0, Q) {
    num left = -1;
    num right = N;
    while (right - left > 1) {
      num mid = left + (right - left) / 2;
      if (A[mid] - B[q] >= 0)
        right = mid;
      else
        left = mid;
    }

    cout << 
      min(
        ((0 <= left && left <= N-1) ? B[q] - A[left] : INF),
        ((0 <= right && right <= N-1) ? A[right] - B[q] : INF)
        )
       << endl;
  }
return 0;
}