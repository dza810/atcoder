// Contest ID: typical90
// Problem ID: typical90_ag ( https://atcoder.jp/contests/typical90/tasks/typical90_ag )
// Title: 033. Not Too Bright（★2）
// Language: C++ (GCC 9.2.1)
// Submitted: 2022-04-28 15:08:22 +0000 UTC ( https://atcoder.jp/contests/typical90/submissions/31327900 ) 

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
  int H, W;
  cin >> H >> W;
  if(H == 1 || W == 1) cout << H * W << endl;
  else cout << (int)((H + 1)/2) * (int)((W + 1)/2) << endl;
  return 0;
}
