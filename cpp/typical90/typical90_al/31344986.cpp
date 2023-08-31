// Contest ID: typical90
// Problem ID: typical90_al ( https://atcoder.jp/contests/typical90/tasks/typical90_al )
// Title: 038. Large LCM（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-29 12:37:10 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31344986 ) 

#include <atcoder/modint>
#include <bits/stdc++.h>
using namespace std;
using mint = atcoder::modint998244353;

using ll = long long;
using num = int;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;

int main() {
  ll A, B;
  cin >> A >> B;
  if (B > A)
    swap(A, B);
  ll a = A;
  ll b = B;
  ll bb;
  while (b > 0) {
    bb = b;
    b = a % bb;
    a = bb;
  }
  ll x = A / a;
  if (B <= 1'000'000'000'000'000'000LL/x)
    cout << x * B << endl;
  else {
    cout << "Large" << endl;
  }
  return 0;
}
