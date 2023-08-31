// Contest ID: abc182
// Problem ID: abc182_e ( https://atcoder.jp/contests/abc182/tasks/abc182_e )
// Title: E. Akari
// Language: C++ (GCC 9.2.1)
// Submitted: 2020-11-09 07:46:21 +0000 UTC ( https://atcoder.jp/contests/abc182/submissions/18010453 ) 

#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 1; i <= (n); i++)
using ll = int64_t;

int main() {
  ll H, W, N, M;
  cin >> H >> W >> N >> M;
  vector<ll> A(N + 1);
  vector<ll> B(N + 1);
  vector<vector<ll> > block(H + 1, vector<ll>(W + 1, 0));
  rep(i, N) {
    cin >> A[i] >> B[i];
  }
  ll C, D;
  rep(i, M) {
    cin >> C >> D;
    block[C][D] = -1;
  }

  vector<vector<ll> > light_h(H + 1, vector<ll>(W + 1, 0));
  rep(k, N) {
    if (light_h[A[k]][B[k]] == 1) continue;
    ll j = B[k];
    for (ll i = A[k]; i <= H && block[i][j] != -1; i++) {
      light_h[i][j] = 1;
    }
    for (ll i = A[k]; 0 < i && block[i][j] != -1; i--) {
      light_h[i][j] = 1;
    }
  }
  vector<vector<ll> > light_w(H + 1, vector<ll>(W + 1, 0));
  rep(k, N) {
    ll i = A[k];
    for (ll j = B[k]; j <= W && block[i][j] != -1; j++) {
      light_w[i][j] = 1;
    }
    for (ll j = B[k]; 0 < j && block[i][j] != -1; j--) {
      light_w[i][j] = 1;
    }
  }
  ll ans = 0;
  rep(i, H) rep(j, W) if ((light_h[i][j] + light_w[i][j]) > 0) ans++;
  cout << ans << endl;
  return 0;
}