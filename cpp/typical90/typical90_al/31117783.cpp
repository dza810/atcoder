// Contest ID: typical90
// Problem ID: typical90_al ( https://atcoder.jp/contests/typical90/tasks/typical90_al )
// Title: 038. Large LCM（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-20 11:42:07 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31117783 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = int;
#define rep(i, s, n) for (int i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
using vvvi = vector<vvi>;
const int INF = 1 << 30;
const ll large = 1000000000000000000;

ll gcm(ll a, ll b) {
  if (b > a)
    return gcm(b, a);
  if (b == 0)
    return a;
  return gcm(b, a % b);
}

int main() {
  ll A, B;
  cin >> A >> B;
  ll g = gcm(A, B);

  if ((large/A) < (B / g)) {
    cout << "Large" << endl;
  } else
    cout << ((A / g) * B) << endl;

  return 0;
}
