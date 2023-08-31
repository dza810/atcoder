// Contest ID: typical90
// Problem ID: typical90_p ( https://atcoder.jp/contests/typical90/tasks/typical90_p )
// Title: 016. Minimum Coins（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 10:30:04 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30982035 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 60;

ll N, A, B, C;

int main() {
  cin >> N >> A >> B >> C;
  ll out = INF;
  rep(a, 0, 10000) {
    rep(b, 0, 10000) {
      ll x = N - a * A - b * B;
      ll c = x / C + a + b;
      if (x % C == 0LL && x >= 0 && c < 10000) {
        out = min(out, c);
      }
    }
  }
  cout << out << endl;
  return 0;
}