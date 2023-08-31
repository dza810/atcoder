// Contest ID: typical90
// Problem ID: typical90_at ( https://atcoder.jp/contests/typical90/tasks/typical90_at )
// Title: 046. I Love 46（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-29 13:50:24 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31346666 ) 

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

int v(int i) { return ((i % N) + N) % N; }

int main() {
  int N;
  vi A(46, 0);
  vi B(46, 0);
  vi C(46, 0);
  cin >> N;
  int x;
  rep(i, 0, N) {
    cin >> x;
    A[x % 46]++;
  }
  rep(i, 0, N) {
    cin >> x;
    B[x % 46]++;
  }
  rep(i, 0, N) {
    cin >> x;
    C[x % 46]++;
  }
  ll ans = 0;
  rep(a, 0, 46) {
    rep(b, 0, 46) {
      rep(c, 0, 46) {
        if ((a + b + c) % 46 == 0) {
          ans += A[a] * B[b] * C[c];
        }
      }
    }
  }
  cout << ans << endl;
  return 0;
}
