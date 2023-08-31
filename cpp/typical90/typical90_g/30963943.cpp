// Contest ID: typical90
// Problem ID: typical90_g ( https://atcoder.jp/contests/typical90/tasks/typical90_g )
// Title: 007. CP Classes（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-14 11:16:37 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30963943 ) 

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
  vi A(N, 0);
  rep(i, 0, N) cin >> A[i];

  int Q;
  cin >> Q;
  vi B(Q, 0);
  rep(i, 0, Q) cin >> B[i];

  sort(A.begin(), A.end());
  rep(q, 0, Q) {
    int bound = lower_bound(A.begin(), A.end(), B[q]) - A.begin();
    cout << min(bound >= 1 ? B[q] - A[bound - 1] : INF,
                bound <= (N - 1) ? A[bound] - B[q] : INF)
         << endl;
  }
    return 0;
  }