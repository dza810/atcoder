// Contest ID: typical90
// Problem ID: typical90_x ( https://atcoder.jp/contests/typical90/tasks/typical90_x )
// Title: 024. Select +／- One（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-16 04:09:01 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30993900 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int main() {
  ll N, K;
  cin >> N >> K;
  vi A(N, 0);
  vi B(N, 0);
  rep(i, 0, N) cin >> A[i];
  rep(i, 0, N) cin >> B[i];
  ll x = 0;
  rep(i, 0, N) x += abs(A[i] - B[i]);
  if (x <= K && (K - x) % 2 == 0) {
    cout << "Yes" << endl;
    return 0;
  }
  cout << "No" << endl;
  return 0;
}