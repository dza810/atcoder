// Contest ID: typical90
// Problem ID: typical90_x ( https://atcoder.jp/contests/typical90/tasks/typical90_x )
// Title: 024. Select +／- One（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-27 14:13:41 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31308048 ) 

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

int main() {
  int p = 0;
  int N;
  int K;
  cin >> N >> K;
  vi A(N);
  vi B(N);
  rep(i, 0, N) { cin >> A[i]; }
  rep(i, 0, N) { cin >> B[i]; }
  rep(i, 0, N) { p += abs(A[i] - B[i]); }
  if (p <= K && (K - p) % 2 == 0) {
    cout << "Yes" << endl;
  } else
    cout << "No" << endl;
  return 0;
}
