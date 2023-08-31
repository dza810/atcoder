// Contest ID: typical90
// Problem ID: typical90_t ( https://atcoder.jp/contests/typical90/tasks/typical90_t )
// Title: 020. Log Inequality（★3）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-27 13:54:00 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31307647 ) 

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
  ll a, b, c;
  cin >> a >> b >> c;
  ll x = 1;
  rep(i, 0, b) x *= c;
  if(x > a) cout << "Yes" << endl;
  else cout << "No" << endl;

  return 0;
}
