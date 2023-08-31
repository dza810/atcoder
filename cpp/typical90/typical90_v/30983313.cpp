// Contest ID: typical90
// Problem ID: typical90_v ( https://atcoder.jp/contests/typical90/tasks/typical90_v )
// Title: 022. Cubic Cake（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 11:44:02 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30983313 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 60;

vi A(3);

ll gcd(ll x, ll y) {
  if (y == 0)
    return x;
  return gcd(y, x % y);
}

int main() {
  cin >> A[0] >> A[1] >> A[2];

  sort(A.begin(), A.end());

  ll size = gcd(A[0], gcd(A[2], A[1]));
  ll count = 0;
  rep(i, 0, 3) {
    if (A[i] / size > 1) {
      count += A[i] / size - 1LL;
    }
  }
  cout << count << endl;

  return 0;
}
