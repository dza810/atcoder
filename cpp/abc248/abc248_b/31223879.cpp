// Contest ID: abc248
// Problem ID: abc248_b ( https://atcoder.jp/contests/abc248/tasks/abc248_b )
// Title: B. Slimes
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-24 04:29:51 +0000 UTC ( https://atcoder.jp/contests/abc248/submissions/31223879 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
// using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int MOD = 1'000'000'007;
const int INF = 1 << 30;

int main() {
  ll A, B, K;
  cin >> A >> B >> K;
  ll n = 0LL;
  while(B > A){ // < 10**9
    n++;
    A *= K;
  }
  cout << n << endl;
  return 0;
}
