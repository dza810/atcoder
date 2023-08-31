// Contest ID: typical90
// Problem ID: typical90_t ( https://atcoder.jp/contests/typical90/tasks/typical90_t )
// Title: 020. Log Inequality（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-15 11:25:37 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30982996 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (ll i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 60;

ll a, b, c;

int main() {
  cin >> a >> b >> c;
  ll x = 1LL;
  rep(i, 0, b) x *= c;
  if (x > a) {
    cout << "Yes" << endl;
    return 0;
  }
  cout << "No" << endl;

  return 0;
}