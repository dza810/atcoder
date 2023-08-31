// Contest ID: typical90
// Problem ID: typical90_av ( https://atcoder.jp/contests/typical90/tasks/typical90_av )
// Title: 048. I will not drop out（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-29 14:28:42 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31347461 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int N, Q;

vi A(0);

int main() {
  int N, K;
  cin >> N >> K;
  rep(i, 0, N) {
    int a, b;
    cin >> a >> b;
    A.push_back(b);
    A.push_back(a - b);
  }
  sort(A.begin(), A.end());
  ll ans = 0;
  rep(i, 0, K) { ans += A[2 * N - 1 - i]; }
  cout << ans << endl;

  return 0;
}
