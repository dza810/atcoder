// Contest ID: typical90
// Problem ID: typical90_n ( https://atcoder.jp/contests/typical90/tasks/typical90_n )
// Title: 014. We Used to Sing a Song Together（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 09:45:58 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30981254 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const num INF = 2000000000;
const num mod = 1000000007;
int N;
vi A(1000000);
vi B(1000000);

int main() {
  cin >> N;
  rep(i, 0, N) {
    num a;
    cin >> a;
    A[i] = a;
  }
  rep(i, 0, N) {
    num a;
    cin >> a;
    B[i] = a;
  }

  sort(A.begin(), A.begin() + N);
  sort(B.begin(), B.begin() + N);

  ll ans = 0;
  rep(i, 0, N){
    ans += abs( A[i] - B[i] );
  }
  cout << ans << endl;

  return 0;
}