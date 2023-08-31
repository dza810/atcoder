// Contest ID: abc248
// Problem ID: abc248_d ( https://atcoder.jp/contests/abc248/tasks/abc248_d )
// Title: D. Range Count Query
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-24 06:21:37 +0000 UTC ( https://atcoder.jp/contests/abc248/submissions/31226016 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
// using mint = atcoder::modint998244353;

using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;

int main() {
  int N;
  cin >> N;
  vvi m(200100);
  rep(i, 0, N) {
    int a;
    cin >> a;
    m[a].push_back(i);
  }

  int Q;
  cin >> Q;

  rep(i, 0, Q) {
    int L, R, x;
    cin >> L >> R >> x;
    auto posL = lower_bound(m[x].begin(), m[x].end(), L-1);
    auto posR = lower_bound(m[x].begin(), m[x].end(), R);
    cout << posR - posL << endl;
  }
  return 0;
}
