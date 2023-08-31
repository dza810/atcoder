// Contest ID: typical90
// Problem ID: typical90_v ( https://atcoder.jp/contests/typical90/tasks/typical90_v )
// Title: 022. Cubic Cake（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-27 14:02:19 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31307808 ) 

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
  ll A, B, C;
  cin >> A >> B >> C;
  ll a = A;
  ll b = B;
  if (a < b) swap(a, b);
  ll bb;
  while (b > 0) {
    bb = b;
    b = a % bb;
    a = bb;
  }

  b = C;
  if (a < b) swap(a, b);
  while (b > 0) {
    bb = b;
    b = a % bb;
    a = bb;
  }

  cout << (A / a) + (B / a) + (C / a) -3 << endl;
  return 0;
}
