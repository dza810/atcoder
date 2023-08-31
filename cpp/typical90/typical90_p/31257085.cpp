// Contest ID: typical90
// Problem ID: typical90_p ( https://atcoder.jp/contests/typical90/tasks/typical90_p )
// Title: 016. Minimum Coins（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-25 03:54:31 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31257085 ) 

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
  int N, A, B, C;
  cin >> N >> A >> B >> C;
  ll ans = 10000;
  rep(a, 0, 10000) {
    rep(b, 0, 10000) {
      ll x = N - a * A - b * B;
      if(x < 0) break;
      if (x % C == 0) {
        int c = x / C;
        ans = min(ans, a + b + c);
      }
    }
  }
  cout << ans << endl;
  return 0;
}
