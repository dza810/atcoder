// Contest ID: typical90
// Problem ID: typical90_g ( https://atcoder.jp/contests/typical90/tasks/typical90_g )
// Title: 007. CP Classes（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-21 12:31:03 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31135411 ) 

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
int M;
vi A(300001,0);

int main() {
  cin >> N;
  rep(i, 0, N) cin >> A[i];
  sort(A.begin(), A.begin() + N);

  cin >> M;
  rep(i, 0, M) {
    int b;
    cin >> b;
    int pos = lower_bound(A.begin(), A.begin()+N, b) - A.begin();
    int x1 = INF;
    int x2 = INF;
    if (0 <= pos && pos < N)
      x1 = A[pos] - b;
    if (1 <= pos && pos < N + 1)
      x2 = b - A[pos - 1];
    cout << min(x1, x2) << endl;
  }

  return 0;
}
