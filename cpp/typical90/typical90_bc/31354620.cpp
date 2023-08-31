// Contest ID: typical90
// Problem ID: typical90_bc ( https://atcoder.jp/contests/typical90/tasks/typical90_bc )
// Title: 055. Select 5（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-30 02:45:00 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31354620 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint1000000007;

using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  ll N, P, Q;
  cin >> N >> P >> Q;
  vi A(N, 0);
  rep(i, 0, N) cin >> A[i];

  int ans = 0;
  rep(a, 0, N) {
    rep(b, 0, a) {
      rep(c, 0, b) {
        rep(d, 0, c) {
          rep(e, 0, d) {
            if (Q ==
                ((((A[a] % P) * A[b] % P) * A[c] % P) * A[d] % P) * A[e] % P) {
              ans++;
            }
          }
        }
      }
    }
  }
  cout << ans << endl;
  return 0;
}
