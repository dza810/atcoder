// Contest ID: typical90
// Problem ID: typical90_v ( https://atcoder.jp/contests/typical90/tasks/typical90_v )
// Title: 022. Cubic Cake（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-16 04:00:42 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30993779 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

ll gcd(ll a, ll b) {
  if (b > a) {
    swap(a, b);
  }
  if (b == 0) {
    return a;
  }
  return gcd(b, a % b);
}

int main() {
  ll A, B, C;
  cin >> A >> B >> C;
  ll x = gcd(A, gcd(B, C));
  ll count = 0;
  count += A / x - 1;
  count += B / x - 1;
  count += C / x - 1;
  cout << count << endl;
}