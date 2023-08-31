// Contest ID: typical90
// Problem ID: typical90_t ( https://atcoder.jp/contests/typical90/tasks/typical90_t )
// Title: 020. Log Inequality（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-16 03:54:40 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/30993701 ) 

#include "bits/stdc++.h"

using namespace std;
using ll = long long;
using num = ll;
#define rep(i, s, n) for (num i = (s); i < (n); i++)
using P = pair<int, num>;
using vi = vector<num>;
using vvi = vector<vi>;
const ll INF = 1LL << 59;

int main() {
  ll a,b,c;
  cin >> a >> b >> c;
  ll x = 1;
  rep(i, 0, b) x *= c;
  cout << (x - a > 0 ? "Yes" : "No") << endl;
  return 0;
}